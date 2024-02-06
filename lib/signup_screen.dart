// ignore: duplicate_ignore
// ignore: implementation_imports
// ignore_for_file: implementation_imports, prefer_const_constructors

import 'package:detectnew/login_screen.dart';
import 'package:detectnew/screens/glassmorphism.dart';
import 'package:detectnew/screens/reusable_widget.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:detectnew/detect.dart';
import 'package:detectnew/login_screen.dart';
import 'package:detectnew/screens/glassmorphism.dart';
import 'package:detectnew/screens/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/farmer.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'S I G N  U P',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              const Spacer(),
              Spacer(),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Glassmorphism(
                      blur: 1,
                      opacity: 0.5,
                      radius: 20,
                      child: Container(
                        height: 500,
                        width: 500,
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        // ignore: duplicate_ignore
                        child: Column(children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'E-MAIL:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          reusableTextField("Enter Email", Icons.email, false,
                              _emailTextController),

                          SizedBox(
                            height: 10,
                          ),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'USERNAME:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          reusableTextField("Enter Username", Icons.person,
                              false, _usernameTextController),
                          SizedBox(
                            height: 10,
                          ),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'PASSWORD:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          reusableTextField(
                            "Enter Password",
                            Icons.lock,
                            true,
                            _passwordTextController,
                          ),

                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 15,
                          ),

                          signInSignUpButton(context, false, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HomeScreen())));
                          }),
                          signOption(),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: 350,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row signOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("ALREADY HAVE AN ACCOUNT?",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  // ignore: prefer_const_constructors
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: const Text(
              "  LOGIN HERE",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
