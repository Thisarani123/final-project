// ignore: unused_import
import 'package:detectnew/detect.dart';
import 'package:detectnew/login_screen.dart';
import 'package:detectnew/profile_setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:detectnew/WelcomePage.dart';
import 'package:detectnew/appledetail.dart';
import 'package:detectnew/fruitinfo.dart';
import 'package:detectnew/OpeningPage.dart';
import 'package:detectnew/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'OpeningPage.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpeningPage(),
    );
  }
}
