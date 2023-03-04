import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gdsc_project/page/loginpage/loginpage.dart';
import 'package:gdsc_project/page/registerPage/register.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo-2.png',
              width: 130,
              height: 130,
            ),
            const Text('Let us know you first!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            const Text('What are you?',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => RegisterPageScreen(typeUser: 'farmer',)));
              },
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.17,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.bedroom_baby,
                      size: 70,
                      color: Colors.green,
                    ),
                    Text('Farmer',
                        style: TextStyle(fontSize: 20, color: Colors.green))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => RegisterPageScreen(typeUser: 'customer',)));
              },
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.17,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.bedroom_baby, size: 70, color: Colors.green),
                    Text('Buyer/Consumer',
                        style: TextStyle(fontSize: 20, color: Colors.green))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?',
                      style: TextStyle(color: Colors.white)),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (ctx) => LoginPage()));
                      },
                      child: const Text('Login',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
