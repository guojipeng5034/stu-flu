#!/usr/bin/env node

/**
 * 翻译系统构建脚本
 * 
 * 功能：
 * 1. 执行 flutter gen-l10n
 * 2. 执行 build_runner 生成代码
 * 
 * 使用方法：
 * node scripts/build_translations.js
 */

const { spawn } = require('child_process');
const fs = require('fs');

console.log('🚀 开始构建翻译系统...\n');

// 检查必要的文件是否存在
const arbDir = 'lib/l10n/arb';
const l10nConfig = 'l10n.yaml';

if (!fs.existsSync(arbDir)) {
    console.error('❌ ARB目录不存在:', arbDir);
    process.exit(1);
}

if (!fs.existsSync(l10nConfig)) {
    console.error('❌ l10n.yaml配置文件不存在');
    process.exit(1);
}

// 执行命令的Promise包装
function executeCommand(command, args, description) {
    return new Promise((resolve, reject) => {
        console.log(`🔄 ${description}...`);
        console.log(`   执行: ${command} ${args.join(' ')}`);
        
        const process = spawn(command, args, { 
            stdio: 'pipe',
            shell: true 
        });
        
        let stdout = '';
        let stderr = '';
        
        process.stdout.on('data', (data) => {
            const output = data.toString();
            stdout += output;
            // 显示重要的输出信息
            if (output.includes('Generated') || output.includes('Built') || output.includes('Generating')) {
                console.log(`   📄 ${output.trim()}`);
            }
        });
        
        process.stderr.on('data', (data) => {
            const error = data.toString();
            stderr += error;
            // 显示警告和错误信息
            if (error.includes('Warning') || error.includes('Error')) {
                console.log(`   ⚠️  ${error.trim()}`);
            }
        });
        
        process.on('close', (code) => {
            if (code === 0) {
                console.log(`   ✅ ${description} 完成\n`);
                resolve(stdout);
            } else {
                console.error(`   ❌ ${description} 失败 (退出码: ${code})`);
                if (stderr) console.error(`   错误信息: ${stderr}`);
                reject(new Error(`${description} 失败`));
            }
        });
        
        process.on('error', (error) => {
            console.error(`   ❌ ${description} 执行错误: ${error.message}`);
            reject(new Error(`${description} 执行错误: ${error.message}`));
        });
    });
}

// 主要构建流程
async function buildTranslations() {
    const startTime = Date.now();
    
    try {
        // 1. 执行 flutter gen-l10n
        await executeCommand('flutter', ['gen-l10n'], 'Flutter 本地化生成');
        
        // 2. 执行 build_runner 生成代码
        await executeCommand('flutter', ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'], 'Build Runner 代码生成');
        
        const duration = ((Date.now() - startTime) / 1000).toFixed(1);
        console.log('🎉 翻译系统构建完成！');
        console.log(`⏱️  总耗时: ${duration}s`);
        console.log('💡 现在可以使用 T.键名 访问所有翻译（基于AppLocalizations）');
        
    } catch (error) {
        const duration = ((Date.now() - startTime) / 1000).toFixed(1);
        console.error(`❌ 构建失败 (耗时: ${duration}s):`, error.message);
        process.exit(1);
    }
}

// 执行构建
buildTranslations();
