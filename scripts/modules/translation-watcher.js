#!/usr/bin/env node

/**
 * 翻译文件监听器模块
 * 
 * 功能：
 * 1. 监听 ARB 文件变化
 * 2. 自动执行 flutter gen-l10n
 * 3. 提供启动/停止接口
 * 4. 事件驱动架构
 */

const { spawn } = require('child_process');
const fs = require('fs');
const EventEmitter = require('events');

class TranslationWatcher extends EventEmitter {
    constructor(options = {}) {
        super();
        this.options = {
            arbDir: 'lib/l10n/arb',
            l10nConfig: 'l10n.yaml',
            debounceDelay: 1000,
            ...options
        };
        
        this.watcher = null;
        this.isBuilding = false;
        this.buildQueue = [];
        this.updateTimeout = null;
        this.isRunning = false;
    }

    /**
     * 启动监听器
     */
    async start() {
        if (this.isRunning) {
            throw new Error('翻译监听器已在运行中');
        }

        console.log('🔍 启动翻译文件监听器...');
        
        // 检查前置条件
        this.checkPrerequisites();
        
        // 启动文件监听
        this.startFileWatcher();
        
        this.isRunning = true;
        console.log('✅ 翻译监听器启动成功');
        console.log(`📁 监听目录: ${this.options.arbDir}`);
        console.log('🔄 检测到ARB文件变化时将自动执行 flutter gen-l10n');
        
        return this;
    }

    /**
     * 停止监听器
     */
    async stop() {
        if (!this.isRunning) {
            return;
        }

        console.log('🛑 停止翻译文件监听器...');
        
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
        
        this.isRunning = false;
        this.emit('stop');
        console.log('✅ 翻译监听器已停止');
    }

    /**
     * 检查前置条件
     */
    checkPrerequisites() {
        if (!fs.existsSync(this.options.arbDir)) {
            throw new Error(`ARB目录不存在: ${this.options.arbDir}`);
        }

        if (!fs.existsSync(this.options.l10nConfig)) {
            throw new Error('l10n.yaml配置文件不存在');
        }

        // 检查ARB文件
        const arbFiles = fs.readdirSync(this.options.arbDir).filter(file => file.endsWith('.arb'));
        if (arbFiles.length === 0) {
            console.warn('⚠️  ARB目录中没有找到.arb文件');
        } else {
            console.log(`✅ 找到 ${arbFiles.length} 个ARB文件: ${arbFiles.join(', ')}`);
        }
    }

    /**
     * 启动文件监听
     */
    startFileWatcher() {
        try {
            this.watcher = fs.watch(this.options.arbDir, { recursive: true }, (eventType, filename) => {
                if (filename && filename.endsWith('.arb')) {
                    const timestamp = new Date().toLocaleTimeString();
                    console.log(`📄 [${timestamp}] 检测到文件变化: ${filename} (${eventType})`);
                    this.debounceUpdate();
                }
            });
        } catch (error) {
            throw new Error(`启动文件监听器失败: ${error.message}`);
        }
    }

    /**
     * 防抖更新
     */
    debounceUpdate() {
        clearTimeout(this.updateTimeout);
        this.updateTimeout = setTimeout(() => {
            if (!this.isBuilding) {
                this.updateTranslations();
            } else {
                console.log('⏳ 构建进行中，将在完成后重新触发...');
                this.buildQueue.push(() => this.updateTranslations());
            }
        }, this.options.debounceDelay);
    }

    /**
     * 更新翻译
     */
    async updateTranslations() {
        if (this.isBuilding) {
            console.log('⏳ 构建已在进行中，跳过此次触发');
            return;
        }

        this.isBuilding = true;
        console.log('\n🔄 检测到ARB文件变化，开始更新翻译系统...');
        const startTime = Date.now();

        try {
            // 执行 flutter gen-l10n
            console.log('📝 执行 flutter gen-l10n...');
            await this.executeCommand('flutter', ['gen-l10n']);
            console.log('   ✅ flutter gen-l10n 完成');

            const duration = ((Date.now() - startTime) / 1000).toFixed(1);
            console.log(`\n✅ 翻译系统更新完成！(耗时: ${duration}s)`);
            console.log('💡 现在可以使用 T.键名 访问所有翻译');
            
            this.emit('updated', { duration });

        } catch (error) {
            const duration = ((Date.now() - startTime) / 1000).toFixed(1);
            console.error(`❌ 更新失败 (耗时: ${duration}s):`, error.message);
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
                }, 500);
            }
        }
    }

    /**
     * 手动触发更新
     */
    async manualUpdate() {
        if (this.isBuilding) {
            console.log('⏳ 构建进行中，请稍后再试...');
            return;
        }
        
        console.log('🔄 手动触发翻译系统更新...');
        await this.updateTranslations();
    }

    /**
     * 执行命令
     */
    executeCommand(command, args) {
        return new Promise((resolve, reject) => {
            console.log(`   🔄 执行: ${command} ${args.join(' ')}`);

            const childProcess = spawn(command, args, {
                stdio: 'pipe',
                shell: true,
                env: { ...process.env, FORCE_COLOR: '1' }
            });

            let stdout = '';
            let stderr = '';
            let hasOutput = false;

            childProcess.stdout.on('data', (data) => {
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
                        line.includes('Info:')) {
                        console.log(`   📄 ${line.trim()}`);
                    }
                });
            });

            childProcess.stderr.on('data', (data) => {
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

            childProcess.on('close', (code) => {
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

            childProcess.on('error', (error) => {
                reject(new Error(`命令执行错误: ${error.message}`));
            });

            // 添加超时处理（2分钟）
            const timeout = setTimeout(() => {
                childProcess.kill('SIGTERM');
                reject(new Error('命令执行超时（2分钟）'));
            }, 2 * 60 * 1000);

            childProcess.on('close', () => {
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
            arbDir: this.options.arbDir
        };
    }
}

module.exports = TranslationWatcher;
