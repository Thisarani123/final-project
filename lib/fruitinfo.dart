import 'package:detectnew/appledetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:detectnew/utils.dart';

class friutinfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => appledetails()),
        );
      },
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            padding:
                EdgeInsets.fromLTRB(11 * fem, 58 * fem, 19 * fem, 80 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(50 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(5 * fem, 0 * fem, 0 * fem, 22 * fem),
                  width: double.infinity,
                  height: 238 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 39 * fem, 0 * fem),
                        width: 170 * fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  12 * fem, 39 * fem, 13 * fem, 16 * fem),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff23990f),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30 * fem),
                                  topRight: Radius.circular(30 * fem),
                                ),
                              ),
                              child: Center(
                                child: SizedBox(
                                  width: 145 * fem,
                                  height: 125 * fem,
                                  child: Image.asset(
                                    'assets/images/mango.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 58 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xff086628),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30 * fem),
                                  bottomLeft: Radius.circular(30 * fem),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Mango',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 170 * fem,
                        height: 234 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0 * fem,
                              top: 0 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 170 * fem,
                                  height: 180 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff23990f),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30 * fem),
                                        topRight: Radius.circular(30 * fem),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0 * fem,
                              top: 176 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 170 * fem,
                                  height: 58 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff086628),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(30 * fem),
                                        bottomLeft: Radius.circular(30 * fem),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 49 * fem,
                              top: 194 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 72 * fem,
                                  height: 25 * fem,
                                  child: Text(
                                    'Papaya',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 20 * ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2125 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 13 * fem,
                              top: 53 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 143 * fem,
                                  height: 106 * fem,
                                  child: Image.asset(
                                    'assets/images/papaya.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(5 * fem, 0 * fem, 0 * fem, 0 * fem),
                  width: double.infinity,
                  height: 180 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 39 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            23 * fem, 51 * fem, 24 * fem, 22 * fem),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff23990f),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30 * fem),
                            topRight: Radius.circular(30 * fem),
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 123 * fem,
                            height: 107 * fem,
                            child: Image.asset(
                              'assets/images/banana.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            15 * fem, 32 * fem, 14 * fem, 17 * fem),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff23990f),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30 * fem),
                            topRight: Radius.circular(30 * fem),
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 141 * fem,
                            height: 131 * fem,
                            child: Image.asset(
                              'assets/images/apple.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.fromLTRB(5 * fem, 0 * fem, 0 * fem, 22 * fem),
                  width: double.infinity,
                  height: 58 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 39 * fem, 0 * fem),
                        width: 170 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff086628),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30 * fem),
                            bottomLeft: Radius.circular(30 * fem),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Banana',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 170 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff086628),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30 * fem),
                            bottomLeft: Radius.circular(30 * fem),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '      Apple',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 180 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 44 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            7 * fem, 34 * fem, 7 * fem, 13 * fem),
                        width: 170 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff23990f),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30 * fem),
                            topRight: Radius.circular(30 * fem),
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 142 * fem,
                            height: 133 * fem,
                            child: Image.asset(
                              'assets/images/grapes.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            6 * fem, 50 * fem, 6 * fem, 29 * fem),
                        width: 170 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff23990f),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30 * fem),
                            topRight: Radius.circular(30 * fem),
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 150 * fem,
                            height: 101 * fem,
                            child: Image.asset(
                              'assets/images/orange.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 58 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 44 * fem, 0 * fem),
                        width: 170 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff086628),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30 * fem),
                            bottomLeft: Radius.circular(30 * fem),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Grapes',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 170 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff086628),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30 * fem),
                            bottomLeft: Radius.circular(30 * fem),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Orange',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
