import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class RegisterAccount extends StateNotifier<String> {
  RegisterAccount() : super('');

  Future<void> registerAccount(
      String email, String password, String username, String role) async {
    try {
      final response = await http.post(
          Uri.parse('https://agrilink-backend.vercel.app/auth/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "email": email,
            "password": password,
            "username": username,
            "role": role
          }));
     
     
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

final registerAccountProvider =
    StateNotifierProvider<RegisterAccount, String>((ref) => RegisterAccount());
