import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/page/bottomnavigation_bar.dart';
import 'package:gdsc_project/page/home_page.dart';
import 'package:gdsc_project/page/loginpage/loginpage.dart';
import 'package:gdsc_project/page/registerPage/letus.dart';
import 'package:gdsc_project/page/splash-screen/first_splashscreen.dart';
import 'package:gdsc_project/provider/auth_provider/auth_provider.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStatus = ref.watch(userStreamState);
    return userStatus.when(
      data: (user) {
        if (user != null) {
          return BottomNavigationBarPage();
        } else {
          return FirstSplashScreen();
        }
      },
      error: (error, stackTrace) => LoginPage(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
