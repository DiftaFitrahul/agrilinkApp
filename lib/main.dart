import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_project/page/splash-screen/first_splashscreen.dart';
import 'package:gdsc_project/firebase_options.dart';
import 'package:gdsc_project/page/splash-screen/second_splashscreen.dart';

import '../page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.green),
      debugShowCheckedModeBanner: false,
      home: const SecondSplashScreen(),
    );
  }
}
