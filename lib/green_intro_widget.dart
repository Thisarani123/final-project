// ignore_for_file: prefer_const_constructors, unused_import, duplicate_ignore, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:detectnew/app_colors.dart';

Widget greenIntroWidget() {
  return Container(
    width: 80,
    decoration: BoxDecoration(
        gradient: LinearGradient(
      // ignore: prefer_const_literals_to_create_immutables
      colors: [
        Color.fromARGB(255, 27, 110, 165),
        Color.fromARGB(255, 75, 159, 211),
        Color.fromARGB(255, 51, 155, 229),
        Color.fromARGB(255, 10, 235, 100),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    )),
    height: 50,
  );
}

Widget greenIntroWidgetWithoutLogos() {
  return Container(
    width: 435,
    decoration: BoxDecoration(
        gradient: LinearGradient(
      // ignore: prefer_const_literals_to_create_immutables
      colors: [
        Color.fromARGB(255, 218, 222, 93),
        Color.fromARGB(255, 107, 246, 130),
        Color.fromARGB(255, 184, 248, 125),
        Color.fromARGB(197, 215, 245, 21),
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomCenter,
    )),
    height: 140,
    child: Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.only(bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        )),
  );
}
