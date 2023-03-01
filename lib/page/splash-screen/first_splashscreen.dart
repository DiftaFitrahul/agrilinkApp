import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gdsc_project/page/home_page.dart';
import 'package:gdsc_project/page/splash-screen/second_splashscreen.dart';

class FirstSplashScreen extends StatefulWidget {
  const FirstSplashScreen({super.key});

  @override
  State<FirstSplashScreen> createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  bool end = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      end = true;
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SecondSplashScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: end ? 0 : 1,
          child: const Image(
              width: 170,
              height: 170,
              image: AssetImage('assets/images/logo-1.png')),
        ),
      ),
    );
  }
}
