import 'package:detectnew/detect.dart';
import 'package:detectnew/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:detectnew/utils.dart';

class appledetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
        child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => profilesetting()),
        );
      },
      child: Container(
        width: double.infinity,
        child: Container(
          // iphone11promax9Dd6 (115:2)
          padding:
              EdgeInsets.fromLTRB(20 * fem, 128 * fem, 16 * fem, 100 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff000000)),
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(25 * fem),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/appledetail.png',
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
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: 0 * fem,
              sigmaY: 0 * fem,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // cweatherTJU (115:5)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 362 * fem),
                  child: RichText(
                    text: TextSpan(
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 32 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2102272511 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                      children: [
                        TextSpan(
                          text: '21-24C    ',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 32 * ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                        TextSpan(
                          text: 'Weather',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 25 * ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // appleapplemalusdomesticadomest (115:4)
                  margin:
                      EdgeInsets.fromLTRB(16 * fem, 0 * fem, 0 * fem, 0 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 362 * fem,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                      children: [
                        TextSpan(
                          text: 'APPLE\n',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                        TextSpan(
                          text:
                              '\nApple, (Malus domestica), domesticated tree and fruit of the rose family (',
                        ),
                        TextSpan(
                          text: 'Rosaceae',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125 * ffem / fem,
                            decoration: TextDecoration.underline,
                            color: Color(0xffffffff),
                            decorationColor: Color(0xffffffff),
                          ),
                        ),
                        TextSpan(
                          text:
                              '), one of the most widely cultivated tree fruits. Apples are predominantly grown for sale as fresh fruit, though apples are also used commercially for vineger, juice, jelly, applesauce, and apple butter and are canned as pie stock.',
                        ),
                      ],
                    ),
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
