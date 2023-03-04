import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/service/auth_service/authentication_service.dart';

final authProvider = Provider<AuthenticationService>(
  (ref) => AuthenticationService(),
);

final userStreamState = StreamProvider<User?>(
  (ref) => ref.read(authProvider).userState,
);

class AuthStateProvider extends StateNotifier<bool> {
  AuthStateProvider(this.ref) : super(false);
  final Ref ref;
  Future<void> signIn(String email, String password) async {
    try {
      state = true;
      await ref.read(authProvider).signIn(email, password);
    } catch (e) {
      state = false;
      rethrow;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      state = true;
      await ref.read(authProvider).signUp(email, password);
    } catch (e) {
      state = false;
      rethrow;
    }
  }

  Future<void> googleSignIn() async {
    try {
      state = true;
      await ref.read(authProvider).signInWithGoogle();
    } catch (e) {
      state = false;
      rethrow;
    }
  }

  void changeState() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      state = false;
    });
  }
}

final authStateProvider = StateNotifierProvider<AuthStateProvider, bool>(
    (ref) => AuthStateProvider(ref));
