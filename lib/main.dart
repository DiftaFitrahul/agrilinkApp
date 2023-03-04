import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/page/account_page.dart';
import 'package:gdsc_project/page/auth_checker.dart';
import 'package:gdsc_project/page/bottomnavigation_bar.dart';
import 'package:gdsc_project/page/forum_page_discussion.dart';
import 'package:gdsc_project/page/loginpage/loginpage.dart';
import 'package:gdsc_project/page/item_buyer_page.dart';
import 'package:gdsc_project/page/registerPage/letus.dart';
import 'package:gdsc_project/page/registerPage/register.dart';
import 'package:gdsc_project/page/registerPage/silderIntro_page.dart';
import 'package:gdsc_project/page/splash-screen/first_splashscreen.dart';
import 'package:gdsc_project/firebase_options.dart';
import 'package:gdsc_project/page/splash-screen/second_splashscreen.dart';

import '../page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 135, 193, 89)),
      debugShowCheckedModeBanner: false,
      home: AuthChecker(),
    );
  }
}
