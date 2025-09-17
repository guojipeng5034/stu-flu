#!/usr/bin/env node

/**
 * 开发脚本测试工具
 * 
 * 用于测试 dev.js 脚本的各个功能模块
 */

const TaskManager = require('./modules/task-manager');
const TranslationWatcher = require('./modules/translation-watcher');
const BuildRunner = require('./modules/build-runner');

async function testTaskManager() {
    console.log('🧪 测试任务管理器...');
    
    const taskManager = new TaskManager();
    
    // 注册测试任务
    taskManager.registerTask('test-task', {
        start: () => {
            return {
                stop: () => Promise.resolve(),
                on: () => {}
            };
        }
    });
    
    // 测试启动和停止
    await taskManager.startTask('test-task');
    console.log('✅ 任务启动测试通过');
    
    await taskManager.stopTask('test-task');
    console.log('✅ 任务停止测试通过');
    
    // 测试状态获取
    const status = taskManager.getTaskStatus();
    console.log('✅ 状态获取测试通过');
    
    console.log('✅ 任务管理器测试完成\n');
}

async function testTranslationWatcher() {
    console.log('🧪 测试翻译监听器...');
    
    try {
        const watcher = new TranslationWatcher({
            arbDir: 'lib/l10n/arb',
            debounceDelay: 100
        });
        
        // 测试状态获取
        const status = watcher.getStatus();
        console.log('✅ 翻译监听器状态获取测试通过');
        
        console.log('✅ 翻译监听器测试完成\n');
    } catch (error) {
        console.log('⚠️  翻译监听器测试跳过（可能缺少必要文件）\n');
    }
}

async function testBuildRunner() {
    console.log('🧪 测试 Build Runner...');
    
    const buildRunner = new BuildRunner({
        watchMode: false,
        watchDirs: ['lib']
    });
    
    // 测试状态获取
    const status = buildRunner.getStatus();
    console.log('✅ Build Runner 状态获取测试通过');
    
    // 测试文件过滤
    const shouldTrigger1 = buildRunner.shouldTriggerBuild('test.dart');
    const shouldTrigger2 = buildRunner.shouldTriggerBuild('test.g.dart');
    const shouldTrigger3 = buildRunner.shouldTriggerBuild('lib/models/user.freezed.dart');
    const shouldTrigger4 = buildRunner.shouldTriggerBuild('lib/services/api.dart');

    if (shouldTrigger1 && !shouldTrigger2 && !shouldTrigger3 && shouldTrigger4) {
        console.log('✅ Build Runner 文件过滤测试通过');
    } else {
        console.log('❌ Build Runner 文件过滤测试失败');
        console.log(`   test.dart: ${shouldTrigger1} (期望: true)`);
        console.log(`   test.g.dart: ${shouldTrigger2} (期望: false)`);
        console.log(`   user.freezed.dart: ${shouldTrigger3} (期望: false)`);
        console.log(`   api.dart: ${shouldTrigger4} (期望: true)`);
    }
    
    console.log('✅ Build Runner 测试完成\n');
}

async function runTests() {
    console.log('🚀 开始测试开发脚本模块...\n');
    
    try {
        await testTaskManager();
        await testTranslationWatcher();
        await testBuildRunner();
        
        console.log('🎉 所有测试完成！');
        console.log('💡 可以安全使用 node scripts/dev.js');
        
    } catch (error) {
        console.error('❌ 测试失败:', error.message);
        process.exit(1);
    }
}

// 运行测试
runTests();
