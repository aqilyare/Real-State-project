import 'package:flutter/material.dart';
import 'package:realstateproject/home_screen.dart';
import 'package:realstateproject/login.dart';
import 'package:realstateproject/main_screen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(home: LoginScreen());
=======
    return MaterialApp(home: loginScreen());
>>>>>>> dce1833e121f8210b61cda7a73c7f014f010db3d
  }
}
