import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:realstateproject/auth/screens/login.dart';

class AuthServices {
  String baseUrl = "";
  void login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final http.Response response = await http.post(
        Uri.parse("$baseUrl/api/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );
      if (response.statusCode == 200) {
        final role = jsonDecode(response.body)["data"]["role"];

        if (role == "admin") {
          // nav
        } else {
          // home
        }
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  void register({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final http.Response response = await http.post(
        Uri.parse("$baseUrl/api/create-user"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "name": name,
          "phone": phone,
        }),
      );

      if (response.statusCode == 201) {
        // Check if the widget is still mounted
        if (context.mounted) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
