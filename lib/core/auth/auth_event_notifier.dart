import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_events.dart';

class AuthEventNotifier extends StateNotifier<AuthEvent?> {
  AuthEventNotifier() : super(null);

  void notify(AuthEvent event) {
    state = event;
  }

  // Optional: A method to clear the event if needed
  void clear() {
    state = null;
  }
}
