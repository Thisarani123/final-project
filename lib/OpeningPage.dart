// ignore: file_names
import 'package:detectnew/WelcomePage.dart';
import 'package:detectnew/fruitinfo.dart';
import 'package:detectnew/login_screen.dart';
import 'package:detectnew/login_screen.dart';
import 'package:detectnew/profile_setting.dart';
import 'package:detectnew/appledetail.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:detectnew/main.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';

import 'main.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OpeningPageState createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  // ignore: prefer_typing_uninitialized_variables, annotate_overrides
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(milliseconds: 4000), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        // ignore: prefer_const_constructors
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
              // ignore: prefer_const_constructors
              Color.fromARGB(255, 35, 233, 98),
              // ignore: prefer_const_constructors
              Color(0xFFe8e9eb)
            ])),

        // ignore: avoid_unnecessary_containers
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                // ignore: prefer_const_constructors
                image: DecorationImage(
                    // ignore: prefer_const_constructors
                    image: AssetImage(
                  "assets/images/logon1.png",
                ))

                // ignore: prefer_const_literals_to_create_immutables
                ),
          ),
        ),
      ),
    );

    // ignore: unused_label, dead_code
  }
}
