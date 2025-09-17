#!/usr/bin/env node

/**
 * Flutter 开发脚本 - 统一开发工具入口
 * 
 * 功能：
 * 1. 管理多个开发任务（翻译监听、build_runner等）
 * 2. 支持交互式选择和命令行参数
 * 3. 提供任务状态监控和控制
 * 4. 模块化设计，任务间无耦合
 * 
 * 使用方法：
 * node scripts/dev.js                    # 交互式选择
 * node scripts/dev.js --translation      # 只启动翻译监听
 * node scripts/dev.js --build-runner     # 只启动 build_runner
 * node scripts/dev.js --all              # 启动所有任务
 * node scripts/dev.js --help             # 显示帮助
 */

const TaskManager = require('./modules/task-manager');
const TranslationWatcher = require('./modules/translation-watcher');
const BuildRunner = require('./modules/build-runner');

class DevScript {
    constructor() {
        this.taskManager = new TaskManager();
        this.isInteractive = false;
        this.setupTasks();
        this.setupEventHandlers();
    }

    /**
     * 设置任务
     */
    setupTasks() {
        // 注册翻译监听任务
        this.taskManager.registerTask('translation', {
            start: (options = {}) => {
                const watcher = new TranslationWatcher(options);
                return watcher.start();
            }
        });

        // 注册 Build Runner 任务（监听模式）
        this.taskManager.registerTask('build-runner-watch', {
            start: (options = {}) => {
                const buildRunner = new BuildRunner({
                    watchMode: true,
                    ...options
                });
                return buildRunner.start();
            }
        });

        // 注册 Build Runner 任务（手动模式）
        this.taskManager.registerTask('build-runner-manual', {
            start: (options = {}) => {
                const buildRunner = new BuildRunner({
                    watchMode: false,
                    ...options
                });
                return buildRunner.start();
            }
        });
    }

    /**
     * 设置事件处理
     */
    setupEventHandlers() {
        // 监听任务事件
        this.taskManager.on('taskStarted', (name) => {
            console.log(`🎉 任务 "${name}" 已启动`);
        });

        this.taskManager.on('taskStopped', (name) => {
            console.log(`📴 任务 "${name}" 已停止`);
        });

        this.taskManager.on('taskError', (name, error) => {
            console.error(`💥 任务 "${name}" 发生错误: ${error.message}`);
        });

        // 优雅退出处理
        process.on('SIGINT', async () => {
            console.log('\n👋 正在停止所有任务...');
            await this.taskManager.stopAllTasks();
            process.exit(0);
        });

        process.on('SIGTERM', async () => {
            await this.taskManager.stopAllTasks();
            process.exit(0);
        });
    }

    /**
     * 解析命令行参数
     */
    parseArgs() {
        const args = process.argv.slice(2);
        const options = {
            translation: false,
            buildRunner: false,
            buildRunnerWatch: false,
            all: false,
            help: false,
            interactive: false
        };

        for (const arg of args) {
            switch (arg) {
                case '--translation':
                case '-t':
                    options.translation = true;
                    break;
                case '--build-runner':
                case '-b':
                    options.buildRunner = true;
                    break;
                case '--build-runner-watch':
                case '-bw':
                    options.buildRunnerWatch = true;
                    break;
                case '--all':
                case '-a':
                    options.all = true;
                    break;
                case '--help':
                case '-h':
                    options.help = true;
                    break;
                case '--interactive':
                case '-i':
                    options.interactive = true;
                    break;
            }
        }

        // 如果没有指定任何选项，默认为交互模式
        if (!options.translation && !options.buildRunner && !options.buildRunnerWatch && 
            !options.all && !options.help) {
            options.interactive = true;
        }

        return options;
    }

    /**
     * 显示帮助信息
     */
    showHelp() {
        console.log(`
🚀 Flutter 开发脚本

用法:
  node scripts/dev.js [选项]

选项:
  -t, --translation         启动翻译文件监听器
  -b, --build-runner        启动 Build Runner (手动模式)
  -bw, --build-runner-watch 启动 Build Runner (监听模式)
  -a, --all                 启动所有任务
  -i, --interactive         交互式选择 (默认)
  -h, --help                显示此帮助信息

示例:
  node scripts/dev.js                    # 交互式选择
  node scripts/dev.js -t                 # 只启动翻译监听
  node scripts/dev.js -bw                # 只启动 Build Runner 监听模式
  node scripts/dev.js -t -b              # 启动翻译监听和 Build Runner 手动模式
  node scripts/dev.js --all              # 启动所有任务

任务说明:
  📝 翻译监听器        - 监听 ARB 文件变化，自动执行 flutter gen-l10n
  🏗️  Build Runner 监听 - 监听 Dart 文件变化，自动执行 build_runner
  🔧 Build Runner 手动 - 提供手动触发 build_runner 的接口

快捷键 (交互模式):
  r/R - 手动刷新翻译
  b/B - 手动执行 build_runner
  s/S - 显示任务状态
  h/H - 显示帮助
  q/Q - 退出程序
        `);
    }

    /**
     * 交互式选择
     */
    async interactiveMode() {
        this.isInteractive = true;
        
        console.log(`
🚀 Flutter 开发脚本 - 交互模式

请选择要启动的任务:
  1. 翻译文件监听器
  2. Build Runner (监听模式)
  3. Build Runner (手动模式)
  4. 翻译监听 + Build Runner 监听
  5. 所有任务
  0. 退出

请输入选项 (1-5, 0): `);

        // 设置标准输入
        process.stdin.setRawMode(true);
        process.stdin.resume();
        process.stdin.setEncoding('utf8');

        process.stdin.on('data', async (key) => {
            const choice = key.toString().trim();
            
            switch (choice) {
                case '1':
                    console.log('\n🎯 启动翻译文件监听器...');
                    await this.taskManager.startTask('translation');
                    this.startInteractiveControl();
                    break;
                case '2':
                    console.log('\n🎯 启动 Build Runner (监听模式)...');
                    await this.taskManager.startTask('build-runner-watch');
                    this.startInteractiveControl();
                    break;
                case '3':
                    console.log('\n🎯 启动 Build Runner (手动模式)...');
                    await this.taskManager.startTask('build-runner-manual');
                    this.startInteractiveControl();
                    break;
                case '4':
                    console.log('\n🎯 启动翻译监听 + Build Runner 监听...');
                    await this.taskManager.startTasks(['translation', 'build-runner-watch']);
                    this.startInteractiveControl();
                    break;
                case '5':
                    console.log('\n🎯 启动所有任务...');
                    await this.taskManager.startTasks(['translation', 'build-runner-watch', 'build-runner-manual']);
                    this.startInteractiveControl();
                    break;
                case '0':
                case 'q':
                case 'Q':
                    console.log('\n👋 退出程序');
                    await this.taskManager.stopAllTasks();
                    process.exit(0);
                    break;
                default:
                    console.log('\n❌ 无效选项，请重新选择 (1-5, 0): ');
                    break;
            }
        });
    }

    /**
     * 启动交互式控制
     */
    startInteractiveControl() {
        console.log(`
✅ 任务已启动！

交互式控制:
  r/R - 手动刷新翻译
  b/B - 手动执行 build_runner  
  s/S - 显示任务状态
  h/H - 显示帮助
  q/Q - 退出程序
`);

        // 移除之前的监听器，避免重复绑定
        process.stdin.removeAllListeners('data');
        
        process.stdin.on('data', async (key) => {
            const command = key.toString().trim().toLowerCase();
            
            switch (command) {
                case 'r':
                    await this.handleManualTranslation();
                    break;
                case 'b':
                    await this.handleManualBuild();
                    break;
                case 's':
                    this.taskManager.displayStatus();
                    break;
                case 'h':
                    this.showInteractiveHelp();
                    break;
                case 'q':
                    console.log('\n👋 退出程序');
                    await this.taskManager.stopAllTasks();
                    process.exit(0);
                    break;
            }
        });
    }

    /**
     * 处理手动翻译
     */
    async handleManualTranslation() {
        const task = this.taskManager.tasks.get('translation');
        if (task && task.instance) {
            console.log('\n🔄 手动触发翻译更新...');
            await task.instance.manualUpdate();
        } else {
            console.log('\n⚠️  翻译监听器未运行');
        }
    }

    /**
     * 处理手动构建
     */
    async handleManualBuild() {
        const watchTask = this.taskManager.tasks.get('build-runner-watch');
        const manualTask = this.taskManager.tasks.get('build-runner-manual');
        
        if (watchTask && watchTask.instance) {
            console.log('\n🔄 手动触发 Build Runner (监听模式)...');
            await watchTask.instance.manualBuild();
        } else if (manualTask && manualTask.instance) {
            console.log('\n🔄 手动触发 Build Runner (手动模式)...');
            await manualTask.instance.manualBuild();
        } else {
            console.log('\n⚠️  Build Runner 未运行');
        }
    }

    /**
     * 显示交互式帮助
     */
    showInteractiveHelp() {
        console.log(`
📖 交互式控制帮助:
  r/R - 手动刷新翻译系统
  b/B - 手动执行 build_runner
  s/S - 显示所有任务状态
  h/H - 显示此帮助信息
  q/Q - 停止所有任务并退出
`);
    }

    /**
     * 启动脚本
     */
    async start() {
        console.log('🚀 Flutter 开发脚本启动中...\n');
        
        const options = this.parseArgs();

        if (options.help) {
            this.showHelp();
            return;
        }

        if (options.interactive) {
            await this.interactiveMode();
            return;
        }

        // 根据参数启动对应任务
        const tasksToStart = [];
        
        if (options.all) {
            tasksToStart.push('translation', 'build-runner-watch', 'build-runner-manual');
        } else {
            if (options.translation) {
                tasksToStart.push('translation');
            }
            if (options.buildRunnerWatch) {
                tasksToStart.push('build-runner-watch');
            }
            if (options.buildRunner) {
                tasksToStart.push('build-runner-manual');
            }
        }

        if (tasksToStart.length > 0) {
            console.log(`🎯 启动任务: ${tasksToStart.join(', ')}`);
            await this.taskManager.startTasks(tasksToStart);
            
            // 启动简单的状态监控
            this.startStatusMonitor();
        } else {
            console.log('❌ 未指定任务，使用 --help 查看帮助');
        }
    }

    /**
     * 启动状态监控
     */
    startStatusMonitor() {
        console.log('\n✅ 任务已启动！按 Ctrl+C 停止所有任务\n');
        
        // 每30秒显示一次状态
        const statusInterval = setInterval(() => {
            this.taskManager.displayStatus();
        }, 30000);

        // 清理定时器
        process.on('exit', () => {
            clearInterval(statusInterval);
        });
    }
}

// 启动脚本
const devScript = new DevScript();
devScript.start().catch(error => {
    console.error('❌ 启动失败:', error.message);
    process.exit(1);
});
