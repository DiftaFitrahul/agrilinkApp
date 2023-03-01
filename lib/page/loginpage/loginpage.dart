import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color green1 = Color.fromARGB(255, 135, 193, 89);
    final Color green2 = Color.fromARGB(255, 5, 130, 64);
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.86,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(
                    fontSize: 30, color: green2, fontWeight: FontWeight.bold),
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
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    hintText: 'user@gmail.com',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    filled: true,
                    fillColor: green2,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white.withOpacity(0.7),
                    )),
              ),
              const SizedBox(
                height: 10,
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
              TextField(
                controller: _emailController,
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    hintText: 'password',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
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
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                      color: green1, borderRadius: BorderRadius.circular(12)),
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
                padding: const EdgeInsets.only(top: 40, bottom: 30),
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
                      onPressed: () {},
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
              )
            ],
          ),
        ),
      )),
    );
  }
}
