import 'package:cptop/features/auth/ui/providers/auth_provider.dart';
import 'package:cptop/shared/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// 启动页面
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    // 等待一段时间显示启动画面
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    try {
      // 等待认证状态初始化完成
      await Future.delayed(const Duration(milliseconds: 500));

      if (!mounted) return;

      // 安全地检查认证状态
      final authState = ref.read(authProvider);

      if (authState.isAuthenticated) {
        // 已登录，跳转到主页
        if (mounted) {
          context.go(RouteNames.home);
        }
      } else {
        // 未登录或状态未初始化，跳转到登录页
        if (mounted) {
          context.go(RouteNames.login);
        }
      }
    } catch (e) {
      // 如果出现错误，默认跳转到登录页
      print('启动页认证检查错误: $e');
      if (mounted) {
        context.go(RouteNames.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.flutter_dash,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 24),
              Text(
                'Flutter App',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '正在初始化...',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 32),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
