// ignore: unnecessary_import
// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, unnecessary_import, implementation_imports, depend_on_referenced_packages, unused_import

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:detectnew/app_colors.dart';
import 'package:detectnew/green_intro_widget.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class profilesetting extends StatefulWidget {
  const profilesetting({super.key});

  @override
  State<profilesetting> createState() => _profilesettingState();
}

// ignore: camel_case_types
class _profilesettingState extends State<profilesetting> {
  var currentIndex = 0;
  final List<Widget> _children = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  getImage(ImageSource source) async {
    XFile? image = await _picker.pickImage(source: source);
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 160, 79),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              child: Stack(
                children: [
                  greenIntroWidgetWithoutLogos(),

                  // ignore: prefer_const_constructors
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 110,
                      height: 110,
                      // ignore: prefer_const_constructors
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 193, 193, 195),
                        image: DecorationImage(
                            image: AssetImage('assets/images/p.jpg'),
                            fit: BoxFit.cover),
                      ),

                      // ignore: prefer_const_constructors
                    ),
                  ),
                  Positioned(
                      bottom: 1,
                      left: 230,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 4, 13, 20),
                        radius: 15,
                        // ignore: sort_child_properties_last
                        child: Icon(Icons.edit),
                        foregroundColor: Colors.white,
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFieldWidget('User Name', Icons.person, nameController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Name is required!';
                      }
                      if (input.length < 5) {
                        return 'Please enter a valid name!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        'Email ID', Icons.email_rounded, emailController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Email is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                        'Phone Number', Icons.phone, phonenumberController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Phone number is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget('Password', Icons.lock, passwordController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Password is required!';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 40,
                    ),
                    blackButton('UPDATE', () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 74, 200, 234),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 2,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .17),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .32
                      : displayWidth * .40,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Color.fromARGB(255, 232, 245, 245).withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .35,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex
                                  ? '${listOfStrings[index]}'
                                  : '',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? Colors.black
                                : Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.person_pin,
  ];

  List<String> listOfStrings = [
    'Home',
    'Profile',
  ];
}

// ignore: non_constant_identifier_names
TextFieldWidget(String title, IconData iconData,
    TextEditingController controller, Function validator) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: GoogleFonts.poppins(
            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      const SizedBox(
        height: 6,
      ),
      Container(
        width: 350,
        height: 55,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 200, 200, 200),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          validator: (input) => validator(input),
          controller: controller,
          style: GoogleFonts.poppins(
              fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                iconData,
                color: Color.fromARGB(255, 62, 70, 65),
              ),
            ),
            border: OutlineInputBorder(),
          ),
        ),
      )
    ],
  );
}

Widget blackButton(String title, Function onPressed) {
  return MaterialButton(
    minWidth: 180,
    height: 45,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    color: AppColors.blackColor,
    onPressed: () => onPressed(),
    child: Text(
      title,
      style: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
