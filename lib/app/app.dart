import 'package:cptop/app/app_initialization_provider.dart';
import 'package:cptop/app/theme.dart';
import 'package:cptop/core/localization/index.dart';
import 'package:cptop/features/auth/ui/providers/auth_provider.dart';
import 'package:cptop/shared/router/app_router.dart';
import 'package:cptop/shared/services/navigation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 认证状态监听器组件
class AuthStateListener extends ConsumerStatefulWidget {
  final Widget child;

  const AuthStateListener({super.key, required this.child});

  @override
  ConsumerState<AuthStateListener> createState() => _AuthStateListenerState();
}

class _AuthStateListenerState extends ConsumerState<AuthStateListener> {
  AuthStatus? _previousStatus;
  bool _hasHandledInitialAuth = false;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    // 监听认证状态变化
    ref.listen<AuthState>(authProvider, (previous, current) {
      print(
          'AuthStateListener: 认证状态变化 ${previous?.status} -> ${current.status}');

      // 只在认证状态从未认证变为已认证时处理跳转
      if (previous?.status != AuthStatus.authenticated &&
          current.status == AuthStatus.authenticated &&
          !_hasHandledInitialAuth) {
        _hasHandledInitialAuth = true;
        print('AuthStateListener: 检测到新的认证状态，处理登录后导航');

        // 使用 SchedulerBinding 确保在下一帧执行
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            NavigationService.handlePostLoginNavigation(ref);
          }
        });
      }
    });

    return widget.child;
  }
}

/// 应用程序主类
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 监听应用初始化状态
    final initializationAsync = ref.watch(appInitializationProvider);

    // 监听当前语言环境
    final currentLocale = ref.watch(currentLocaleProvider);

    return initializationAsync.when(
      data: (initState) {
        if (initState.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    const Text('应用初始化失败'),
                    const SizedBox(height: 8),
                    Text(initState.errorMessage!),
                  ],
                ),
              ),
            ),
          );
        }

        return AuthStateListener(
          child: MaterialApp.router(
            title: 'Flutter App',

            // 主题配置
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,

            // 路由配置
            routerConfig: ref.watch(routerProvider),

            // 本地化配置
            locale: currentLocale,
            supportedLocales: LocalizationConfig.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            // 简化主题配置，避免 TextStyle 插值问题
            builder: (context, child) => child!,
          ),
        );
      },
      loading: () => AuthStateListener(
        child: MaterialApp.router(
          title: 'Flutter App',

          // 主题配置
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,

          // 在初始化期间也使用路由配置
          routerConfig: ref.watch(routerProvider),

          // 本地化配置
          locale: currentLocale,
          supportedLocales: LocalizationConfig.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ),
      error: (error, stack) => MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red),
                SizedBox(height: 16),
                Text('应用初始化失败'),
                SizedBox(height: 8),
                Text(error.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
