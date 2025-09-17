import 'package:cptop/features/auth/index.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Authentication Flow Tests', () {
    // 由于登录页面依赖复杂的Provider链，暂时跳过UI测试
    // 专注于核心的AuthProvider逻辑测试
  });

  group('AuthProvider Tests', () {
    test('Initial auth state is correct', () {
      final authState = AuthState.initial();
      expect(authState.status, AuthStatus.initial);
      expect(authState.isAuthenticated, false);
      expect(authState.userId, null);
      expect(authState.token, null);
    });

    test('Authenticated state is correct', () {
      const token = 'test_token';
      const userId = 'test_user_id';
      final authState = AuthState.authenticated(token: token, userId: userId);

      expect(authState.status, AuthStatus.authenticated);
      expect(authState.isAuthenticated, true);
      expect(authState.userId, userId);
      expect(authState.token, token);
    });

    test('Error state is correct', () {
      const errorMessage = 'Test error message';
      final authState = AuthState.error(errorMessage);

      expect(authState.status, AuthStatus.error);
      expect(authState.isAuthenticated, false);
      expect(authState.errorMessage, errorMessage);
    });

    test('AuthState copyWith works correctly', () {
      final originalState = AuthState.initial();
      final newState = originalState.copyWith(
        status: AuthStatus.authenticating,
        userId: 'new_user_id',
      );

      expect(newState.status, AuthStatus.authenticating);
      expect(newState.userId, 'new_user_id');
      expect(newState.token, originalState.token);
      expect(newState.errorMessage, originalState.errorMessage);
    });
  });
}
