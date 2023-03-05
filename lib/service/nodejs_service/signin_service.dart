import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class SignInAccount extends StateNotifier<String> {
  SignInAccount() : super('');

  Future<void> signInAccount(String email, String password) async {
    try {
      final response = await http.post(
          Uri.parse('https://agrilink-backend.vercel.app/auth/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "email": email,
            "password": password,
          }));
      final data = jsonDecode(response.body);
      print('========================');
      print(data.toString());
      print('========================');
      if (response.statusCode == 200) {
        state = response.body.toString();
      } else {
        state = 'error';
      }
    } catch (e) {
      rethrow;
    }
  }
}

final signInAccountProvider =
    StateNotifierProvider<SignInAccount, String>((ref) => SignInAccount());
