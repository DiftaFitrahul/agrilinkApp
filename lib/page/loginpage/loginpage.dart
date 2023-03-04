import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/page/bottomnavigation_bar.dart';
import 'package:gdsc_project/page/home_page.dart';
import 'package:gdsc_project/page/registerPage/letus.dart';
import 'package:gdsc_project/provider/auth_provider/auth_provider.dart';
import 'package:http/http.dart' as http;

class LoginPage extends ConsumerStatefulWidget {
  LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void toJson(String email, String password) async {
    print('================================');
    Map<String, dynamic> toJson = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
          Uri.parse('https://agrilink-backend.vercel.app/auth/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(toJson));
      print('================================');

      print(response.body.toString());
      print('================================');
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final Color green1 = Color.fromARGB(255, 135, 193, 89);
    final Color green2 = Color.fromARGB(255, 5, 130, 64);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.86,
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                        fontSize: 30,
                        color: green2,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email/Username',
                          style: TextStyle(
                              fontSize: 20,
                              color: green2,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintText: 'user@gmail.com',
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.7)),
                        filled: true,
                        fillColor: green2,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white.withOpacity(0.7),
                        )),
                    validator: (value) {
                      if (value!.contains('@')) {
                        return null;
                      } else {
                        return 'invalid email';
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'password',
                          style: TextStyle(
                              fontSize: 20,
                              color: green2,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        hintText: 'password',
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.7)),
                        filled: true,
                        fillColor: green2,
                        prefixIcon: Icon(
                          Icons.vpn_key_rounded,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white.withOpacity(0.7),
                        )),
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'password at least 8 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 4, bottom: 28),
                    child: InkWell(
                      onTap: () {},
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('Forgot password?',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: green2,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline))),
                    ),
                  ),
                  authState
                      ? const CircularProgressIndicator()
                      : InkWell(
                          onTap: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            ref
                                .read(authStateProvider.notifier)
                                .signIn(_emailController.text,
                                    _passwordController.text)
                                .then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigationBarPage(),
                                  ));
                              ref
                                  .read(authStateProvider.notifier)
                                  .changeState();
                            }).catchError((e) {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(
                                    SnackBar(content: Text(e.toString())));

                              return;
                            });
                            toJson(_emailController.text,
                                _passwordController.text);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                                color: green1,
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                                child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: green1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text('or, you can continue using',
                              style: TextStyle(color: green2)),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: green1,
                        )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          iconSize: 50,
                          onPressed: () {
                            ref
                                .read(authStateProvider.notifier)
                                .googleSignIn()
                                .then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigationBarPage(),
                                  ));
                              ref
                                  .read(authStateProvider.notifier)
                                  .changeState();
                            }).catchError((e) {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(
                                    SnackBar(content: Text(e.toString())));

                              return;
                            });
                          },
                          icon: Image.asset(
                            'assets/icons/Google.png',
                          )),
                      IconButton(
                          iconSize: 50,
                          onPressed: () {},
                          icon: Image.asset('assets/icons/Facebook.png')),
                      IconButton(
                          iconSize: 50,
                          onPressed: () {},
                          icon: Image.asset('assets/icons/Twitter.png'))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account?",
                          style: TextStyle(fontSize: 13)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => const Register()));
                          },
                          child: const Text('Sign Up',
                              style: TextStyle(fontSize: 13)))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
