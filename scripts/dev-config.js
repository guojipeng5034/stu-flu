#!/usr/bin/env node

/**
 * 开发脚本配置文件
 * 
 * 在这里可以自定义各个任务的默认配置
 */

module.exports = {
    // 翻译监听器配置
    translation: {
        arbDir: 'lib/l10n/arb',
        l10nConfig: 'l10n.yaml',
        debounceDelay: 1000, // 防抖延迟（毫秒）
    },

    // Build Runner 配置
    buildRunner: {
        watchMode: true, // 默认启用监听模式
        deleteConflictingOutputs: true, // 删除冲突输出
        debounceDelay: 2000, // 防抖延迟（毫秒）
        watchDirs: ['lib'], // 监听的目录
        excludePatterns: [
            '**/*.g.dart',
            '**/*.freezed.dart',
            '**/*.chopper.dart',
            '**/generated/**',
            '**/.dart_tool/**'
        ]
    },

    // 任务管理器配置
    taskManager: {
        statusDisplayInterval: 30000, // 状态显示间隔（毫秒）
        maxRetries: 3, // 最大重试次数
        retryDelay: 5000 // 重试延迟（毫秒）
    }
};
