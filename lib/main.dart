// ignore: unused_import
import 'dart:io';

import 'package:detectnew/bananadetail.dart';
import 'package:detectnew/WeatherPage.dart';
import 'package:detectnew/detect.dart';
import 'package:detectnew/grapesdetail.dart';
import 'package:detectnew/login_screen.dart';
import 'package:detectnew/mangodetail.dart';
import 'package:detectnew/orangedetail.dart';
import 'package:detectnew/papayadetail.dart';
import 'package:detectnew/profile_setting.dart';
import 'package:detectnew/signup_screen.dart';
import 'package:detectnew/WelcomePage.dart';
import 'package:detectnew/appledetail.dart';
import 'package:detectnew/fruitinfo.dart';
import 'package:detectnew/OpeningPage.dart';
import 'package:detectnew/chat.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'OpeningPage.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'AIzaSyAGf24z8v0cmmn9AzSxCmPRFk9Xyq4gv3U',
          appId: '1:1081588275546:android:f882110d53d5827f437b63',
          storageBucket: 'plant-detection-f8434.appspot.com',
          messagingSenderId: '1081588275546',
          projectId: 'plant-detection-f8434',
        ))
      : await Firebase.initializeApp();
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
