// 稳定的 Flutter Web Bootstrap
// noinspection JSUnresolvedVariable,JSUnresolvedFunction,JSUnusedGlobalSymbols
// @ts-nocheck
/* eslint-disable */

{{flutter_js}}
{{flutter_build_config}}

// 稳定的 Flutter 加载器
(function() {
    'use strict';
    
    console.log('Stable Flutter Bootstrap starting...');
    
    let bootstrapStage = 'waiting';
    
    // 等待 Flutter 加载器准备就绪
    const waitForFlutterLoader = () => {
        return new Promise((resolve, reject) => {
            let attempts = 0;
            const maxAttempts = 100; // 5秒超时
            
            const checkLoader = () => {
                attempts++;
                
                if (window._flutter && window._flutter.loader && typeof window._flutter.loader.load === 'function') {
                    console.log(`Flutter loader ready after ${attempts * 50}ms`);
                    bootstrapStage = 'ready';
                    resolve();
                } else if (attempts >= maxAttempts) {
                    console.error('Flutter loader timeout');
                    bootstrapStage = 'timeout';
                    reject(new Error('Flutter loader timeout'));
                } else {
                    setTimeout(checkLoader, 50);
                }
            };
            
            checkLoader();
        });
    };
    
    // 启动 Flutter 应用
    const startFlutterApp = async () => {
        try {
            bootstrapStage = 'waiting';
            await waitForFlutterLoader();
            
            bootstrapStage = 'loading';
            console.log('Starting Flutter app...');
            
            // 使用现代 API 加载 Flutter
            await _flutter.loader.load({
                config: {
                    canvasKitBaseUrl: "canvaskit/"
                },
                serviceWorkerSettings: {
                    serviceWorkerVersion: {{flutter_service_worker_version}}
                },
                onEntrypointLoaded: async function(engineInitializer) {
                    console.log('Flutter entrypoint loaded');
                    bootstrapStage = 'initializing';
                    
                    try {
                        // 初始化引擎
                        const appRunner = await engineInitializer.initializeEngine();
                        console.log('Flutter engine initialized');
                        
                        bootstrapStage = 'running';
                        
                        // 运行应用
                        await appRunner.runApp();
                        console.log('Flutter app started successfully');
                        
                        bootstrapStage = 'completed';
                        
                        // 触发首帧事件
                        setTimeout(() => {
                            window.dispatchEvent(new Event('flutter-first-frame'));
                        }, 100);
                        
                    } catch (error) {
                        console.error('Flutter engine/app error:', error);
                        bootstrapStage = 'error';
                        
                        // 即使出错也要隐藏加载页面
                        setTimeout(() => {
                            if (window.hideFlutterLoading) {
                                window.hideFlutterLoading();
                            }
                        }, 1000);
                    }
                }
            });
            
        } catch (error) {
            console.error('Flutter bootstrap error:', error);
            bootstrapStage = 'error';
            
            // 出错时也要隐藏加载页面
            setTimeout(() => {
                if (window.hideFlutterLoading) {
                    window.hideFlutterLoading();
                }
            }, 1000);
        }
    };
    
    // 监控启动状态
    const monitorBootstrap = () => {
        const startTime = performance.now();
        
        const checkStatus = () => {
            const elapsed = (performance.now() - startTime) / 1000;
            console.log(`Bootstrap status: ${bootstrapStage} (${elapsed.toFixed(1)}s)`);
            
            // 如果10秒后还没完成，强制结束
            if (elapsed > 15 && bootstrapStage !== 'completed' && bootstrapStage !== 'error') {
                console.warn('Bootstrap timeout, forcing completion');
                bootstrapStage = 'timeout';
                
                if (window.hideFlutterLoading) {
                    window.hideFlutterLoading();
                }
                return;
            }
            
            // 如果还在进行中，继续监控
            if (bootstrapStage !== 'completed' && bootstrapStage !== 'error' && bootstrapStage !== 'timeout') {
                setTimeout(checkStatus, 1000);
            }
        };
        
        setTimeout(checkStatus, 1500);
    };
    
    // 启动应用和监控
    startFlutterApp();
    monitorBootstrap();
    
})();
