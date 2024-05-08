// ignore: duplicate_ignore
// ignore: implementation_imports
// ignore_for_file: implementation_imports, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:detectnew/detect.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:detectnew/screens/reusable_widget.dart';
import 'package:detectnew/login_screen.dart';
import 'package:detectnew/screens/glassmorphism.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  void _createUserInFirestore(String email, String username, String password) {
  FirebaseFirestore.instance.collection('users').add({
    'email': email,
    'username': username,
    'password': password,
    // You can add more fields here if needed
  }).then((value) {
    print("User added to Firestore with ID: ${value.id}");
    // Optionally, you can perform any actions after user data is stored in Firestore
  }).catchError((error) {
    print("Failed to add user to Firestore: $error");
    // Handle errors here if needed
  });
}


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
              height: 5,
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
              height: 50,
            ),
            const Spacer(),
            Spacer(),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Glassmorphism(
                    blur: 1,
                    opacity: 0.5,
                    radius: 20,
                    child: Container(
                      height: 451,
                      width: 451,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'E-MAIL:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          reusableTextField("Enter Email", Icons.email, false,
                              _emailTextController),
                          SizedBox(
                            height: 2,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'USERNAME:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          reusableTextField("Enter Username", Icons.person,
                              false, _usernameTextController),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'PASSWORD:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          reusableTextField(
                            "Enter Password",
                            Icons.lock,
                            true,
                            _passwordTextController,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          signInSignUpButton(context, false, () {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text)
                                .then((value) {
                              print("Created new account");
                              _createUserInFirestore(
                                  _emailTextController.text,
                                  _usernameTextController.text,
                                  _passwordTextController.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            }).onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                              // Handle errors here if needed
                            });
                          }), // Move the closing parenthesis to this line
                          signOption(),
                        ],
                      ),
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
              "LOGIN HERE",
              style: TextStyle(
                  color: Color.fromARGB(255, 196, 10, 47),
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
