// ignore_for_file: prefer_final_fields, duplicate_ignore, implementation_imports, prefer_const_constructors

// ignore: unnecessary_import
import 'package:detectnew/detect.dart';
import 'package:detectnew/sidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
// ignore: unnecessary_import
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:detectnew/screens/glassmorphism.dart';
// ignore: unused_import
import 'package:detectnew/signup_screen.dart';
import 'package:detectnew/screens/reusable_widget.dart';
import 'package:detectnew/signup_screen.dart';

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
            image: AssetImage('assets/images/farmer.jpg'),
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
                height: 80,
              ),
              const Spacer(),

              Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                child: Glassmorphism(
                  blur: 1,
                  opacity: 0.5,
                  radius: 20,
                  child: Container(
                    height: 290,
                    width: 400,
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
                            fontSize: 13.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      reusableTextField("Enter Username", Icons.person, false,
                          _usernameTextController, height: 45),

                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'PASSWORD:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.5,
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
                        _passwordTextController, height: 45,
                      ),

                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 1,
                      ),

                      signInSignUpButton(context, true, () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _usernameTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => sidebar(profileImageUrl: '', username: '', email: '',)));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      }),
                      SizedBox(
                        height: 1,
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
              "SIGN UP HERE",
              style: TextStyle(
                  color: Color.fromARGB(255, 176, 6, 40),
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
  Widget reusableTextField(String hintText, IconData icon, bool obscureText,
    TextEditingController controller,
    {required double height}) {
  return Container(
    height: height ?? 50, // Default width is 250
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: const Color.fromARGB(255, 10, 10, 10)),
        prefixIcon: Icon(icon, color: Colors.black),
        filled: true,
        fillColor: Color.fromARGB(255, 82, 147, 90).withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

}
