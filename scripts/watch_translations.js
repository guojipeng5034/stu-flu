#!/usr/bin/env node

/**
 * 翻译文件监听器 - 优化版
 *
 * 功能：
 * 1. 实时监听 lib/l10n/arb/ 目录下的ARB文件变化
 * 2. 自动执行 flutter gen-l10n
 * 3. 智能防抖处理，避免频繁触发
 * 4. 详细的进度显示和错误处理
 * 5. 支持手动触发和快捷键操作
 *
 * 使用方法：
 * node scripts/watch_translations.js  # 启动监听
 */

const { spawn } = require('child_process');
const fs = require('fs');
const path = require('path');

// 配置
const arbDir = 'lib/l10n/arb';
const l10nConfig = 'l10n.yaml';
const debounceDelay = 1000; // 防抖延迟（毫秒）- 减少延迟提升响应速度
let isBuilding = false; // 防止并发执行
let buildQueue = []; // 构建队列

// 检查必要的文件是否存在
function checkPrerequisites() {
    console.log('🔍 启动翻译文件监听器...');

    if (!fs.existsSync(arbDir)) {
        console.error(`❌ ARB目录不存在: ${arbDir}`);
        console.log('💡 请创建目录并添加ARB文件后重试');
        process.exit(1);
    }

    if (!fs.existsSync(l10nConfig)) {
        console.error('❌ l10n.yaml配置文件不存在');
        console.log('💡 请确保项目根目录有l10n.yaml配置文件');
        process.exit(1);
    }

    // 检查ARB文件
    const arbFiles = fs.readdirSync(arbDir).filter(file => file.endsWith('.arb'));
    if (arbFiles.length === 0) {
        console.warn('⚠️  ARB目录中没有找到.arb文件');
    } else {
        console.log(`✅ 找到 ${arbFiles.length} 个ARB文件: ${arbFiles.join(', ')}`);
    }

    console.log('📁 监听目录: lib/l10n/arb/');
    console.log('🔄 检测到ARB文件变化时将自动执行：');
    console.log('   1️⃣  flutter gen-l10n');
    console.log('⏹️  按 Ctrl+C 停止监听\n');
}

checkPrerequisites();

// 防抖函数，避免频繁触发
let updateTimeout;
function debounceUpdate(callback, delay = debounceDelay) {
    clearTimeout(updateTimeout);
    updateTimeout = setTimeout(() => {
        if (!isBuilding) {
            callback();
        } else {
            console.log('⏳ 构建进行中，将在完成后重新触发...');
            buildQueue.push(callback);
        }
    }, delay);
}

// 执行更新流程
async function updateTranslations() {
    if (isBuilding) {
        console.log('⏳ 构建已在进行中，跳过此次触发');
        return;
    }

    isBuilding = true;
    console.log('\n🔄 检测到ARB文件变化，开始更新翻译系统...');
    const startTime = Date.now();

    try {
        // 执行 flutter gen-l10n
        console.log('📝 执行 flutter gen-l10n...');
        await executeCommand('flutter', ['gen-l10n']);
        console.log('   ✅ flutter gen-l10n 完成');

        const duration = ((Date.now() - startTime) / 1000).toFixed(1);
        console.log(`\n✅ 翻译系统更新完成！(耗时: ${duration}s)`);
        console.log('💡 现在可以使用 T.键名 访问所有翻译（基于AppLocalizations）');
        console.log('🔍 继续监听文件变化...\n');

    } catch (error) {
        const duration = ((Date.now() - startTime) / 1000).toFixed(1);
        console.error(`❌ 更新失败 (耗时: ${duration}s):`, error.message);
        console.log('🔍 继续监听文件变化...\n');
    } finally {
        isBuilding = false;

        // 处理队列中的构建请求
        if (buildQueue.length > 0) {
            console.log(`📋 处理队列中的 ${buildQueue.length} 个构建请求...`);
            buildQueue = []; // 清空队列
            setTimeout(() => updateTranslations(), 500); // 减少延迟提升响应速度
        }
    }
}

// 执行命令的Promise包装
function executeCommand(command, args) {
    return new Promise((resolve, reject) => {
        console.log(`   🔄 执行: ${command} ${args.join(' ')}`);

        const childProcess = spawn(command, args, {
            stdio: 'pipe',
            shell: true,
            env: { ...process.env, FORCE_COLOR: '1' } // 保持颜色输出
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

        // 添加超时处理（2分钟）- 减少超时时间提升响应速度
        const timeout = setTimeout(() => {
            childProcess.kill('SIGTERM');
            reject(new Error('命令执行超时（2分钟）'));
        }, 2 * 60 * 1000);

        childProcess.on('close', () => {
            clearTimeout(timeout);
        });
    });
}

// 监听文件变化
let watcher;
try {
    watcher = fs.watch(arbDir, { recursive: true }, (eventType, filename) => {
        if (filename && filename.endsWith('.arb')) {
            const timestamp = new Date().toLocaleTimeString();
            console.log(`📄 [${timestamp}] 检测到文件变化: ${filename} (${eventType})`);
            debounceUpdate(updateTranslations);
        }
    });

    console.log('👁️  文件监听器已启动');
} catch (error) {
    console.error('❌ 启动文件监听器失败:', error.message);
    process.exit(1);
}

// 添加手动触发功能
process.stdin.setRawMode(true);
process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data', (key) => {
    // Ctrl+C 退出
    if (key === '\u0003') {
        console.log('\n👋 停止监听翻译文件变化');
        if (watcher) watcher.close();
        process.exit(0);
    }
    // 按 r 键手动刷新
    if (key === 'r' || key === 'R') {
        if (isBuilding) {
            console.log('\n⏳ 构建进行中，请稍后再试...');
        } else {
            console.log('\n🔄 手动触发翻译系统更新...');
            updateTranslations();
        }
    }
    // 按 s 键显示状态
    if (key === 's' || key === 'S') {
        console.log('\n📊 当前状态:');
        console.log(`   构建状态: ${isBuilding ? '进行中' : '空闲'}`);
        console.log(`   队列长度: ${buildQueue.length}`);
        console.log(`   监听目录: ${arbDir}`);
        const arbFiles = fs.readdirSync(arbDir).filter(file => file.endsWith('.arb'));
        console.log(`   ARB文件数: ${arbFiles.length}\n`);
    }
    // 按 h 键显示帮助
    if (key === 'h' || key === 'H') {
        console.log('\n📖 快捷键帮助:');
        console.log('   r/R - 手动刷新翻译系统');
        console.log('   s/S - 显示当前状态');
        console.log('   h/H - 显示此帮助信息');
        console.log('   Ctrl+C - 退出监听器\n');
    }
});

// 优雅退出
process.on('SIGINT', () => {
    console.log('\n👋 停止监听翻译文件变化');
    if (watcher) watcher.close();
    process.exit(0);
});

// 处理未捕获的异常
process.on('uncaughtException', (error) => {
    console.error('❌ 未捕获的异常:', error.message);
    if (watcher) watcher.close();
    process.exit(1);
});

process.on('unhandledRejection', (reason, promise) => {
    console.error('❌ 未处理的Promise拒绝:', reason);
});

// 初始提示
console.log('✅ 监听器已启动，等待文件变化...');
console.log('💡 快捷键: r=手动刷新, s=状态, h=帮助, Ctrl+C=退出\n');
