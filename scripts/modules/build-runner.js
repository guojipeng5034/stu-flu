#!/usr/bin/env node

/**
 * Build Runner 模块
 * 
 * 功能：
 * 1. 执行 flutter pub run build_runner build
 * 2. 支持文件监听模式
 * 3. 支持手动触发模式
 * 4. 提供启动/停止接口
 */

const { spawn } = require('child_process');
const fs = require('fs');
const path = require('path');
const EventEmitter = require('events');

class BuildRunner extends EventEmitter {
    constructor(options = {}) {
        super();
        this.options = {
            watchMode: false,
            deleteConflictingOutputs: true,
            watchDirs: ['lib'], // 监听的目录
            debounceDelay: 2000, // build_runner 需要更长的防抖时间
            excludePatterns: [
                '**/*.g.dart',
                '**/*.freezed.dart',
                '**/*.chopper.dart',
                '**/generated/**',
                '**/.dart_tool/**'
            ],
            ...options
        };
        
        this.watcher = null;
        this.isBuilding = false;
        this.buildQueue = [];
        this.updateTimeout = null;
        this.isRunning = false;
        this.childProcess = null;
    }

    /**
     * 启动 Build Runner
     */
    async start() {
        if (this.isRunning) {
            throw new Error('Build Runner 已在运行中');
        }

        console.log('🏗️  启动 Build Runner...');
        
        if (this.options.watchMode) {
            await this.startWatchMode();
        } else {
            await this.startManualMode();
        }
        
        this.isRunning = true;
        console.log('✅ Build Runner 启动成功');
        
        return this;
    }

    /**
     * 停止 Build Runner
     */
    async stop() {
        if (!this.isRunning) {
            return;
        }

        console.log('🛑 停止 Build Runner...');
        
        // 清理定时器
        if (this.updateTimeout) {
            clearTimeout(this.updateTimeout);
            this.updateTimeout = null;
        }
        
        // 关闭文件监听器
        if (this.watcher) {
            this.watcher.close();
            this.watcher = null;
        }
        
        // 终止子进程
        if (this.childProcess) {
            this.childProcess.kill('SIGTERM');
            this.childProcess = null;
        }
        
        this.isRunning = false;
        this.emit('stop');
        console.log('✅ Build Runner 已停止');
    }

    /**
     * 启动监听模式
     */
    async startWatchMode() {
        console.log('👁️  启动文件监听模式...');
        console.log(`📁 监听目录: ${this.options.watchDirs.join(', ')}`);
        
        // 启动文件监听
        this.startFileWatcher();
        
        console.log('🔄 检测到相关文件变化时将自动执行 build_runner');
    }

    /**
     * 启动手动模式
     */
    async startManualMode() {
        console.log('🔧 启动手动模式...');
        console.log('💡 使用 manualBuild() 方法手动触发构建');
    }

    /**
     * 启动文件监听
     */
    startFileWatcher() {
        try {
            // 监听多个目录
            this.options.watchDirs.forEach(dir => {
                if (fs.existsSync(dir)) {
                    const watcher = fs.watch(dir, { recursive: true }, (eventType, filename) => {
                        if (filename && this.shouldTriggerBuild(filename)) {
                            const timestamp = new Date().toLocaleTimeString();
                            console.log(`📄 [${timestamp}] 检测到文件变化: ${filename} (${eventType})`);
                            this.debounceBuild();
                        }
                    });
                    
                    if (!this.watcher) {
                        this.watcher = watcher;
                    }
                }
            });
        } catch (error) {
            throw new Error(`启动文件监听器失败: ${error.message}`);
        }
    }

    /**
     * 判断是否应该触发构建
     */
    shouldTriggerBuild(filename) {
        // 只监听 .dart 文件
        if (!filename.endsWith('.dart')) {
            return false;
        }

        // 排除生成的文件 - 使用简单的字符串匹配
        for (const pattern of this.options.excludePatterns) {
            if (pattern.startsWith('**/')) {
                // 处理 **/ 开头的模式，如 **/*.g.dart
                const suffix = pattern.substring(3); // 移除 **/
                if (filename.endsWith(suffix.replace(/\*/g, ''))) {
                    return false;
                }
            } else if (pattern.includes('**')) {
                // 处理包含 ** 的其他模式
                const parts = pattern.split('**');
                if (parts.length === 2) {
                    const prefix = parts[0];
                    const suffix = parts[1];
                    if (filename.startsWith(prefix) && filename.endsWith(suffix)) {
                        return false;
                    }
                }
            } else {
                // 简单的字符串包含检查
                if (filename.includes(pattern.replace(/\*/g, ''))) {
                    return false;
                }
            }
        }

        return true;
    }

    /**
     * 防抖构建
     */
    debounceBuild() {
        clearTimeout(this.updateTimeout);
        this.updateTimeout = setTimeout(() => {
            if (!this.isBuilding) {
                this.runBuild();
            } else {
                console.log('⏳ 构建进行中，将在完成后重新触发...');
                this.buildQueue.push(() => this.runBuild());
            }
        }, this.options.debounceDelay);
    }

    /**
     * 执行构建
     */
    async runBuild() {
        if (this.isBuilding) {
            console.log('⏳ 构建已在进行中，跳过此次触发');
            return;
        }

        this.isBuilding = true;
        console.log('\n🏗️  开始执行 build_runner...');
        const startTime = Date.now();

        try {
            const args = ['pub', 'run', 'build_runner', 'build'];
            if (this.options.deleteConflictingOutputs) {
                args.push('--delete-conflicting-outputs');
            }

            await this.executeCommand('flutter', args);
            
            const duration = ((Date.now() - startTime) / 1000).toFixed(1);
            console.log(`\n✅ Build Runner 执行完成！(耗时: ${duration}s)`);
            console.log('💡 代码生成已更新');
            
            this.emit('buildCompleted', { duration });

        } catch (error) {
            const duration = ((Date.now() - startTime) / 1000).toFixed(1);
            console.error(`❌ Build Runner 执行失败 (耗时: ${duration}s):`, error.message);
            this.emit('error', error);
        } finally {
            this.isBuilding = false;

            // 处理队列中的构建请求
            if (this.buildQueue.length > 0) {
                console.log(`📋 处理队列中的 ${this.buildQueue.length} 个构建请求...`);
                const callbacks = [...this.buildQueue];
                this.buildQueue = [];
                setTimeout(() => {
                    callbacks.forEach(callback => callback());
                }, 1000);
            }
        }
    }

    /**
     * 手动触发构建
     */
    async manualBuild() {
        if (this.isBuilding) {
            console.log('⏳ 构建进行中，请稍后再试...');
            return;
        }
        
        console.log('🔄 手动触发 Build Runner...');
        await this.runBuild();
    }

    /**
     * 清理生成的文件
     */
    async clean() {
        console.log('🧹 清理生成的文件...');
        const startTime = Date.now();

        try {
            await this.executeCommand('flutter', ['pub', 'run', 'build_runner', 'clean']);
            
            const duration = ((Date.now() - startTime) / 1000).toFixed(1);
            console.log(`✅ 清理完成！(耗时: ${duration}s)`);
            
            this.emit('cleanCompleted', { duration });
        } catch (error) {
            const duration = ((Date.now() - startTime) / 1000).toFixed(1);
            console.error(`❌ 清理失败 (耗时: ${duration}s):`, error.message);
            this.emit('error', error);
        }
    }

    /**
     * 执行命令
     */
    executeCommand(command, args) {
        return new Promise((resolve, reject) => {
            console.log(`   🔄 执行: ${command} ${args.join(' ')}`);

            this.childProcess = spawn(command, args, {
                stdio: 'pipe',
                shell: true,
                env: { ...process.env, FORCE_COLOR: '1' }
            });

            let stdout = '';
            let stderr = '';
            let hasOutput = false;

            this.childProcess.stdout.on('data', (data) => {
                const output = data.toString();
                stdout += output;
                hasOutput = true;

                // 实时显示重要的输出信息
                const lines = output.split('\n').filter(line => line.trim());
                lines.forEach(line => {
                    if (line.includes('Generated') ||
                        line.includes('Built') ||
                        line.includes('Generating') ||
                        line.includes('Running') ||
                        line.includes('Succeeded') ||
                        line.includes('Info:') ||
                        line.includes('[INFO]')) {
                        console.log(`   📄 ${line.trim()}`);
                    }
                });
            });

            this.childProcess.stderr.on('data', (data) => {
                const error = data.toString();
                stderr += error;
                hasOutput = true;

                // 实时显示警告和错误信息
                const lines = error.split('\n').filter(line => line.trim());
                lines.forEach(line => {
                    if (line.includes('Warning') ||
                        line.includes('Error') ||
                        line.includes('Failed') ||
                        line.includes('Exception')) {
                        console.log(`   ⚠️  ${line.trim()}`);
                    } else if (line.trim() && !line.includes('Downloading')) {
                        console.log(`   💬 ${line.trim()}`);
                    }
                });
            });

            this.childProcess.on('close', (code) => {
                this.childProcess = null;
                
                if (code === 0) {
                    if (!hasOutput) {
                        console.log('   📄 命令执行完成（无输出）');
                    }
                    resolve(stdout);
                } else {
                    const errorMsg = stderr || stdout || '未知错误';
                    reject(new Error(`命令执行失败 (退出码: ${code})\n${errorMsg}`));
                }
            });

            this.childProcess.on('error', (error) => {
                this.childProcess = null;
                reject(new Error(`命令执行错误: ${error.message}`));
            });

            // 添加超时处理（10分钟）
            const timeout = setTimeout(() => {
                if (this.childProcess) {
                    this.childProcess.kill('SIGTERM');
                    this.childProcess = null;
                }
                reject(new Error('命令执行超时（10分钟）'));
            }, 10 * 60 * 1000);

            this.childProcess.on('close', () => {
                clearTimeout(timeout);
            });
        });
    }

    /**
     * 获取状态
     */
    getStatus() {
        return {
            isRunning: this.isRunning,
            isBuilding: this.isBuilding,
            queueLength: this.buildQueue.length,
            watchMode: this.options.watchMode,
            watchDirs: this.options.watchDirs
        };
    }
}

module.exports = BuildRunner;
