// ignore_for_file: prefer_final_fields, duplicate_ignore, implementation_imports, prefer_const_constructors

// ignore: unnecessary_import
import 'package:detectnew/detect.dart';
import 'package:detectnew/screens/glassmorphism.dart';
import 'package:detectnew/screens/reusable_widget.dart';
import 'package:detectnew/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
// ignore: unnecessary_import
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:detectnew/detect.dart';
import 'package:detectnew/login_screen.dart';
import 'package:detectnew/screens/glassmorphism.dart';
import 'package:detectnew/screens/reusable_widget.dart';
import 'package:detectnew/signup_screen.dart';

// ignore: unused_import

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _usernameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/farmer.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // ignore: prefer_const_constructors
              SizedBox(
                height: 25,
              ),

              Text(
                'L O G I N',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 100,
              ),
              const Spacer(),

              Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Glassmorphism(
                  blur: 1,
                  opacity: 0.5,
                  radius: 20,
                  child: Container(
                    height: 379,
                    width: 379,
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(children: [
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
                        height: 9,
                      ),

                      reusableTextField("Enter Username", Icons.person, false,
                          _usernameTextController),

                      SizedBox(
                        height: 9,
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
                        height: 9,
                      ),

                      reusableTextField(
                        "Enter Password",
                        Icons.lock,
                        true,
                        _passwordTextController,
                      ),

                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 10,
                      ),

                      signInSignUpButton(context, true, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomeScreen())));
                      }),
                      SizedBox(
                        height: 5,
                      ),
                      signUpOption(),
                    ]),
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

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("NO ACCOUNT?",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  // ignore: prefer_const_constructors
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: const Text(
              "  SIGN UP HERE",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
