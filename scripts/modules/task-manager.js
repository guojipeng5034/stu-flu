#!/usr/bin/env node

/**
 * 任务管理器 - 管理多个开发任务的并发执行
 * 
 * 功能：
 * 1. 管理多个独立任务的生命周期
 * 2. 提供任务状态监控
 * 3. 支持任务的启动、停止、重启
 * 4. 防止任务间的相互干扰
 */

const EventEmitter = require('events');

class TaskManager extends EventEmitter {
    constructor() {
        super();
        this.tasks = new Map();
        this.isShuttingDown = false;
    }

    /**
     * 注册任务
     * @param {string} name - 任务名称
     * @param {Object} taskModule - 任务模块
     */
    registerTask(name, taskModule) {
        if (this.tasks.has(name)) {
            throw new Error(`任务 "${name}" 已存在`);
        }

        const task = {
            name,
            module: taskModule,
            status: 'stopped', // stopped, running, error
            instance: null,
            startTime: null,
            errorCount: 0,
            lastError: null
        };

        this.tasks.set(name, task);
        console.log(`📋 已注册任务: ${name}`);
    }

    /**
     * 启动任务
     * @param {string} name - 任务名称
     * @param {Object} options - 任务选项
     */
    async startTask(name, options = {}) {
        const task = this.tasks.get(name);
        if (!task) {
            throw new Error(`任务 "${name}" 不存在`);
        }

        if (task.status === 'running') {
            console.log(`⚠️  任务 "${name}" 已在运行中`);
            return;
        }

        try {
            console.log(`🚀 启动任务: ${name}`);
            task.status = 'running';
            task.startTime = Date.now();
            task.instance = await task.module.start(options);
            
            // 监听任务事件
            if (task.instance && typeof task.instance.on === 'function') {
                task.instance.on('error', (error) => {
                    this.handleTaskError(name, error);
                });
                
                task.instance.on('stop', () => {
                    this.handleTaskStop(name);
                });
            }

            this.emit('taskStarted', name);
            console.log(`✅ 任务 "${name}" 启动成功`);
        } catch (error) {
            this.handleTaskError(name, error);
            throw error;
        }
    }

    /**
     * 停止任务
     * @param {string} name - 任务名称
     */
    async stopTask(name) {
        const task = this.tasks.get(name);
        if (!task) {
            throw new Error(`任务 "${name}" 不存在`);
        }

        if (task.status !== 'running') {
            console.log(`⚠️  任务 "${name}" 未在运行`);
            return;
        }

        try {
            console.log(`🛑 停止任务: ${name}`);
            if (task.instance && typeof task.instance.stop === 'function') {
                await task.instance.stop();
            }
            this.handleTaskStop(name);
            console.log(`✅ 任务 "${name}" 已停止`);
        } catch (error) {
            console.error(`❌ 停止任务 "${name}" 失败:`, error.message);
            this.handleTaskError(name, error);
        }
    }

    /**
     * 重启任务
     * @param {string} name - 任务名称
     * @param {Object} options - 任务选项
     */
    async restartTask(name, options = {}) {
        await this.stopTask(name);
        await new Promise(resolve => setTimeout(resolve, 1000)); // 等待1秒
        await this.startTask(name, options);
    }

    /**
     * 启动多个任务
     * @param {Array} taskNames - 任务名称数组
     * @param {Object} options - 全局选项
     */
    async startTasks(taskNames, options = {}) {
        const results = [];
        for (const name of taskNames) {
            try {
                await this.startTask(name, options[name] || {});
                results.push({ name, success: true });
            } catch (error) {
                results.push({ name, success: false, error: error.message });
            }
        }
        return results;
    }

    /**
     * 停止所有任务
     */
    async stopAllTasks() {
        this.isShuttingDown = true;
        const taskNames = Array.from(this.tasks.keys());
        
        console.log(`🛑 停止所有任务 (${taskNames.length} 个)...`);
        
        const stopPromises = taskNames.map(name => 
            this.stopTask(name).catch(error => 
                console.error(`停止任务 "${name}" 失败:`, error.message)
            )
        );
        
        await Promise.all(stopPromises);
        console.log('✅ 所有任务已停止');
    }

    /**
     * 获取任务状态
     * @param {string} name - 任务名称，不传则返回所有任务状态
     */
    getTaskStatus(name = null) {
        if (name) {
            const task = this.tasks.get(name);
            return task ? this.formatTaskStatus(task) : null;
        }

        const status = {};
        for (const [taskName, task] of this.tasks) {
            status[taskName] = this.formatTaskStatus(task);
        }
        return status;
    }

    /**
     * 格式化任务状态
     */
    formatTaskStatus(task) {
        const uptime = task.startTime ? Date.now() - task.startTime : 0;
        return {
            name: task.name,
            status: task.status,
            uptime: uptime,
            uptimeFormatted: this.formatUptime(uptime),
            errorCount: task.errorCount,
            lastError: task.lastError
        };
    }

    /**
     * 格式化运行时间
     */
    formatUptime(ms) {
        if (ms < 1000) return `${ms}ms`;
        const seconds = Math.floor(ms / 1000);
        if (seconds < 60) return `${seconds}s`;
        const minutes = Math.floor(seconds / 60);
        if (minutes < 60) return `${minutes}m ${seconds % 60}s`;
        const hours = Math.floor(minutes / 60);
        return `${hours}h ${minutes % 60}m`;
    }

    /**
     * 处理任务错误
     */
    handleTaskError(name, error) {
        const task = this.tasks.get(name);
        if (task) {
            task.status = 'error';
            task.errorCount++;
            task.lastError = error.message;
            task.instance = null;
        }
        
        this.emit('taskError', name, error);
        console.error(`❌ 任务 "${name}" 发生错误:`, error.message);
    }

    /**
     * 处理任务停止
     */
    handleTaskStop(name) {
        const task = this.tasks.get(name);
        if (task) {
            task.status = 'stopped';
            task.instance = null;
            task.startTime = null;
        }
        
        this.emit('taskStopped', name);
    }

    /**
     * 显示任务状态
     */
    displayStatus() {
        console.log('\n📊 任务状态:');
        console.log('─'.repeat(60));
        
        for (const [name, task] of this.tasks) {
            const status = this.formatTaskStatus(task);
            const statusIcon = {
                'running': '🟢',
                'stopped': '⚪',
                'error': '🔴'
            }[status.status] || '❓';
            
            console.log(`${statusIcon} ${name.padEnd(20)} ${status.status.padEnd(10)} ${status.uptimeFormatted}`);
            
            if (status.errorCount > 0) {
                console.log(`   ⚠️  错误次数: ${status.errorCount}, 最后错误: ${status.lastError}`);
            }
        }
        console.log('─'.repeat(60));
    }
}

module.exports = TaskManager;
