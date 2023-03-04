import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPageScreen extends ConsumerStatefulWidget {
  const RegisterPageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegisterPageScreenState();
}

class _RegisterPageScreenState extends ConsumerState<RegisterPageScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _formKey.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 5, 130, 64),
                        ),
                      )),
                ),
                formWidget(
                    'First Name',
                    'first name',
                    const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 5, 130, 64),
                    ),
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    _firstNameController,
                    false, (value) {
                  if (value!.length >= 3) {
                    return null;
                  } else {
                    return 'value at least 3 characters';
                  }
                }),
                formWidget(
                    'Last Name',
                    'last name',
                    const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 5, 130, 64),
                    ),
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    _lastNameController,
                    false, (value) {
                  if (value!.length >= 3) {
                    return null;
                  } else {
                    return 'value at least 3 characters';
                  }
                }),
                formWidget(
                    'Username',
                    'username',
                    const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 5, 130, 64),
                    ),
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    _usernameController,
                    false, (value) {
                  if (value!.length >= 3) {
                    return null;
                  } else {
                    return 'value at least 3 characters';
                  }
                }),
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Username must be 3 - 16 characters. Only alphanumerical characters are allowed.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 5, 130, 64),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                formWidget(
                    'Email',
                    'email',
                    const Icon(
                      Icons.email_outlined,
                      color: Color.fromARGB(255, 5, 130, 64),
                    ),
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    _emailController,
                    false, (value) {
                  if (value!.contains('@') && value.length >= 10) {
                    return null;
                  } else {
                    return 'email invalid';
                  }
                }),
                formWidget(
                    'Password',
                    'password',
                    const Icon(
                      Icons.key_outlined,
                      color: Color.fromARGB(255, 5, 130, 64),
                    ),
                    const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color.fromARGB(255, 5, 130, 64),
                    ),
                    _passwordController,
                    true, (value) {
                  if (value!.length >= 9) {
                    return null;
                  } else {
                    return 'value at least 9 characters';
                  }
                }),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Password must be at least 9 characters long.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 5, 130, 64),
                    ),
                  ),
                ),
                formWidget(
                    'Confirm Password',
                    'confirm password',
                    const Icon(
                      Icons.key_outlined,
                      color: Color.fromARGB(255, 5, 130, 64),
                    ),
                    const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color.fromARGB(255, 5, 130, 64),
                    ),
                    _confirmPasswordController,
                    true, (value) {
                  if (_passwordController.text ==
                          _confirmPasswordController.text &&
                      value!.isNotEmpty) {
                    return null;
                  } else {
                    return 'password is not same';
                  }
                }),
                formWidget(
                    'Security Question',
                    'question',
                    const Icon(Icons.account_circle_outlined,
                        color: Colors.white),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Color.fromARGB(255, 5, 130, 64),
                      size: 40,
                    ),
                    _passwordController,
                    false, (value) {
                  return null;
                }),
                Container(
                  width: double.infinity,
                  height: 60,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 122, 173, 82)),
                  child: const Text(
                    'answer',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 40,
                      child: const Text(
                        'I hereby accept the terms and conditions of registering an account to Agrilink.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 5, 130, 64),
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 122, 173, 82)),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget formWidget(
      String title,
      String hintText,
      Icon prefixIcon,
      Icon suffixIcon,
      controller,
      bool obsecuretext,
      String? Function(String?)? validator) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 5, 130, 64),
              ),
            ),
          ),
          TextFormField(
            controller: controller,
            obscureText: obsecuretext,
            style: const TextStyle(
                color: Color.fromARGB(255, 5, 130, 64), fontSize: 20),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 3,
                  color: Color.fromARGB(255, 5, 130, 64),
                ),
              ),
              contentPadding: const EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 3,
                  color: Color.fromARGB(255, 5, 130, 64),
                ),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 5, 130, 64),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
