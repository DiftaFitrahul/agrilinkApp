import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../page/bottomnavigation_bar.dart';
import '../page/loginpage/loginpage.dart';
import '../page/splash-screen/first_splashscreen.dart';
import '../provider/auth_provider/auth_provider.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStatus = ref.watch(userStreamState);
    return userStatus.when(
      data: (user) {
        if (user != null) {
          return const BottomNavigationBarPage();
        } else {
          return const FirstSplashScreen();
        }
      },
      error: (error, stackTrace) => const LoginPage(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
