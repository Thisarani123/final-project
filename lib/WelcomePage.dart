import 'package:detectnew/detect.dart';
import 'package:detectnew/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:detectnew/utils.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            padding:
                EdgeInsets.fromLTRB(17 * fem, 137 * fem, 17 * fem, 206 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff000000)),
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10 * fem),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/welcome1.png',
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(0 * fem, 4 * fem),
                  blurRadius: 2 * fem,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      2.2 * fem, 0 * fem, 61 * fem, 307 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 319 * fem,
                  ),
                  child: Text(
                    '    Welcome to Banana\n                  Plant Care                   ',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 30 * ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(15 * fem, 0 * fem, 0 * fem, 41 * fem),
                  child: Text(
                    'Keep your plant healthy',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 27 * ffem,
                      fontWeight: FontWeight.bold,
                      height: 1.2125 * ffem / fem,
                      color: Color.fromARGB(255, 255, 252, 252),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        52 * fem, 0 * fem, 51 * fem, 0 * fem),
                    width: double.infinity,
                    height: 82 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40 * fem),
                      gradient: LinearGradient(
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[Color(0xff000000), Color(0xff000000)],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 30 * ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.2125 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
