/**
 * Flutter Web 应用加载进度管理器
 * 提供稳定的加载进度显示和资源监控功能
 */

// 全局变量
let currentProgress = 0;
let loadingStage = 'init';
let stageTimeouts = [];
const startTime = performance.now();

// DOM 元素引用
let progressElement;
let progressText;

/**
 * 初始化加载管理器
 */
function initLoadingManager() {
  progressElement = document.getElementById('progress-fill');
  progressText = document.getElementById('loading-progress');
  
  if (!progressElement || !progressText) {
    console.error('Loading elements not found');
    return;
  }
  
  console.log('Loading manager initialized');
}

/**
 * 平滑更新进度
 * @param {number} targetProgress - 目标进度 (0-100)
 * @param {string} text - 显示文本
 */
function updateProgress(targetProgress, text) {
  const progress = Math.min(Math.max(targetProgress, currentProgress), 100);
  currentProgress = progress;
  
  if (progressElement && progressText) {
    progressElement.style.width = progress + '%';
    progressText.textContent = text;
  }
  
  const elapsed = ((performance.now() - startTime) / 1000).toFixed(1);
  console.log(`[${elapsed}s] ${progress}% - ${text}`);
}

/**
 * 清理所有定时器
 */
function clearStageTimeouts() {
  stageTimeouts.forEach(timeout => clearTimeout(timeout));
  stageTimeouts = [];
}

/**
 * 隐藏 loading 页面
 */
function hideFlutterLoading() {
  clearStageTimeouts();
  const elapsed = ((performance.now() - startTime) / 1000).toFixed(1);
  updateProgress(100, `启动完成! (${elapsed}s)`);
  
  setTimeout(() => {
    const loadingElement = document.getElementById('flutter-loading');
    if (loadingElement) {
      loadingElement.classList.add('fade-out');
      setTimeout(() => {
        loadingElement.style.display = 'none';
        console.log(`Flutter app loaded in ${elapsed}s`);
      }, 500);
    }
  }, 300);
}

/**
 * 启动稳定的分阶段加载进度
 */
function startStableLoading() {
  loadingStage = 'starting';
  updateProgress(5, '初始化加载器...');
  
  // 阶段1：DOM和基础资源 (5% -> 25%)
  stageTimeouts.push(setTimeout(() => {
    if (loadingStage === 'starting') {
      loadingStage = 'dom';
      updateProgress(15, '加载页面资源...');
    }
  }, 300));
  
  stageTimeouts.push(setTimeout(() => {
    if (loadingStage === 'dom') {
      updateProgress(25, '页面准备完成...');
    }
  }, 800));
  
  // 阶段2：Flutter 引擎准备 (25% -> 50%)
  stageTimeouts.push(setTimeout(() => {
    if (loadingStage === 'dom') {
      loadingStage = 'flutter-prep';
      updateProgress(35, '准备 Flutter 引擎...');
    }
  }, 1200));
  
  stageTimeouts.push(setTimeout(() => {
    if (loadingStage === 'flutter-prep') {
      updateProgress(50, 'Flutter 引擎就绪...');
    }
  }, 1600));
  
  // 阶段3：CanvasKit 加载 (50% -> 75%)
  stageTimeouts.push(setTimeout(() => {
    if (loadingStage === 'flutter-prep') {
      loadingStage = 'canvaskit';
      updateProgress(60, '加载 CanvasKit...');
    }
  }, 2000));
  
  stageTimeouts.push(setTimeout(() => {
    if (loadingStage === 'canvaskit') {
      updateProgress(75, 'CanvasKit 加载完成...');
    }
  }, 2500));
  
  // 阶段4：应用启动 (75% -> 90%)
  stageTimeouts.push(setTimeout(() => {
    if (loadingStage === 'canvaskit') {
      loadingStage = 'app-start';
      updateProgress(80, '启动应用...');
    }
  }, 3000));

  stageTimeouts.push(setTimeout(() => {
    if (loadingStage === 'app-start') {
      updateProgress(85, '初始化应用...');
    }
  }, 3500));

  stageTimeouts.push(setTimeout(() => {
    if (loadingStage === 'app-start') {
      updateProgress(90, '准备用户界面...');
    }
  }, 4000));

  // 阶段5：等待首帧渲染 (90% -> 95%)
  stageTimeouts.push(setTimeout(() => {
    if (loadingStage === 'app-start') {
      loadingStage = 'rendering';
      updateProgress(95, '渲染界面中...');
    }
  }, 4500));
  
  // 超时保护：如果15秒后还没有完成，强制隐藏
  stageTimeouts.push(setTimeout(() => {
    if (loadingStage !== 'completed') {
      console.warn('Loading timeout, force completing');
      loadingStage = 'completed';
      updateProgress(100, '加载超时，强制启动...');
      setTimeout(() => {
        hideFlutterLoading();
      }, 500);
    }
  }, 15000));
}

// 暴露全局函数
window.hideFlutterLoading = hideFlutterLoading;

/**
 * 设置网络请求监控
 */
function setupNetworkMonitoring() {
  const originalFetch = window.fetch;
  let dynamicScriptsLoaded = 0;

  if (originalFetch) {
    window.fetch = function(...args) {
      const url = args[0];
      if (typeof url === 'string') {
        // 监听各种类型的资源加载
        if (url.includes('.dart.lib.js')) {
          console.log(`🔄 Loading Dart library: ${url}`);
          updateProgress(Math.min(currentProgress + 3, 90), `加载 Dart 库: ${url.split('/').pop()}`);
        } else if (url.includes('mime_converter')) {
          console.log(`🔄 Loading MIME converter: ${url}`);
          updateProgress(Math.min(currentProgress + 2, 90), '加载 MIME 转换器...');
        } else if (url.includes('canvaskit.wasm') && loadingStage === 'canvaskit') {
          updateProgress(65, '下载 CanvasKit WASM...');
        } else if (url.includes('canvaskit.js') && loadingStage === 'canvaskit') {
          updateProgress(70, '下载 CanvasKit JS...');
        } else if (url.includes('main.dart.js') && loadingStage === 'app-start') {
          updateProgress(90, '下载应用代码...');
        } else if (url.includes('.js') && !url.includes('main.dart.js')) {
          console.log(`🔄 Loading JS resource: ${url}`);
          updateProgress(Math.min(currentProgress + 1, 90), `加载脚本: ${url.split('/').pop()}`);
        }

        // 记录加载时间
        const startTime = performance.now();
        return originalFetch.apply(this, args).then(response => {
          const loadTime = performance.now() - startTime;
          if (url.includes('.js') || url.includes('.wasm')) {
            if (loadTime > 1000) {
              console.warn(`Slow resource: ${url.split('/').pop()} (${loadTime.toFixed(0)}ms)`);
            } else {
              console.log(`✅ Loaded: ${url.split('/').pop()} (${loadTime.toFixed(0)}ms)`);
            }
          }
          return response;
        });
      }
      return originalFetch.apply(this, args);
    };
  }
}

/**
 * 设置动态脚本监控
 */
function setupDynamicScriptMonitoring() {
  let dynamicScriptsLoaded = 0;
  const originalCreateElement = document.createElement;

  document.createElement = function(tagName) {
    const element = originalCreateElement.call(this, tagName);

    if (tagName.toLowerCase() === 'script') {
      console.log('🆕 Dynamic script element created');

      // 监听 src 属性变化
      const observer = new MutationObserver((mutations) => {
        mutations.forEach((mutation) => {
          if (mutation.type === 'attributes' && mutation.attributeName === 'src') {
            const src = element.src;
            if (src) {
              console.log(`🔄 Dynamic script src set: ${src}`);
              if (src.includes('.dart.lib.js') || src.includes('mime_converter')) {
                updateProgress(Math.min(currentProgress + 3, 90), `动态加载: ${src.split('/').pop()}`);
              }
            }
          }
        });
      });

      observer.observe(element, { attributes: true, attributeFilter: ['src'] });

      // 监听加载完成
      element.addEventListener('load', () => {
        const src = element.src;
        if (src) {
          dynamicScriptsLoaded++;
          console.log(`✅ Dynamic script loaded: ${src} (${dynamicScriptsLoaded} total)`);
          if (src.includes('.dart.lib.js') || src.includes('mime_converter')) {
            updateProgress(Math.min(currentProgress + 2, 90), `完成加载: ${src.split('/').pop()}`);
          }
        }
      });

      element.addEventListener('error', (e) => {
        const src = element.src;
        if (src) {
          console.warn(`❌ Dynamic script failed: ${src}`, e);
        }
      });
    }

    return element;
  };
}

/**
 * 设置 Flutter 事件监听
 */
function setupFlutterEventListeners() {
  // Flutter 首帧渲染事件
  window.addEventListener('flutter-first-frame', () => {
    console.log('Flutter first frame rendered');
    loadingStage = 'completed';
    updateProgress(100, '启动完成!');
    setTimeout(() => {
      hideFlutterLoading();
    }, 300);
  });

  // Flutter 引擎初始化事件
  window.addEventListener('flutter-initialized', () => {
    console.log('Flutter initialized');
    if (loadingStage === 'app-start' || loadingStage === 'rendering') {
      updateProgress(92, 'Flutter 初始化完成...');
    }
  });
}

/**
 * 检查 Flutter 是否准备就绪
 */
function checkFlutterReady() {
  if (loadingStage === 'rendering') {
    // 检查是否有 Flutter 应用的根元素
    const flutterView = document.querySelector('flutter-view, flt-glass-pane, flt-scene-host, canvas');
    if (flutterView) {
      console.log('Flutter view detected, completing loading');
      loadingStage = 'completed';
      updateProgress(100, '启动完成!');
      setTimeout(() => {
        hideFlutterLoading();
      }, 500);
    } else {
      // 如果没有检测到，继续检查
      setTimeout(checkFlutterReady, 200);
    }
  }
}

/**
 * 启动 Flutter 准备状态检测
 */
function startFlutterReadyCheck() {
  // 在渲染阶段开始检测
  setTimeout(() => {
    if (loadingStage === 'rendering') {
      checkFlutterReady();
    }
  }, 5000);
}

/**
 * 初始化所有加载功能
 */
function initializeLoading() {
  // 初始化基础管理器
  initLoadingManager();

  // 设置监控功能
  setupNetworkMonitoring();
  setupDynamicScriptMonitoring();
  setupFlutterEventListeners();

  // 启动加载进程
  startStableLoading();
  startFlutterReadyCheck();

  console.log('Flutter loading system initialized');
}

// 暴露全局函数
window.hideFlutterLoading = hideFlutterLoading;
window.initializeLoading = initializeLoading;

// 导出模块（如果需要）
if (typeof module !== 'undefined' && module.exports) {
  module.exports = {
    initLoadingManager,
    updateProgress,
    hideFlutterLoading,
    startStableLoading,
    initializeLoading
  };
}
