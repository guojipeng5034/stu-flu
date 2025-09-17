import 'package:flutter/material.dart';

/// 应用加载屏幕
/// 在应用初始化期间显示
class AppLoadingScreen extends StatelessWidget {
  final String? message;
  
  const AppLoadingScreen({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                message ?? '正在初始化应用...',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 应用错误屏幕
/// 在应用初始化失败时显示
class AppErrorScreen extends StatelessWidget {
  final String error;
  final VoidCallback? onRetry;
  
  const AppErrorScreen({
    super.key,
    required this.error,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
                const Text(
                  '应用初始化失败',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  error,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                if (onRetry != null)
                  ElevatedButton(
                    onPressed: onRetry,
                    child: const Text('重试'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
