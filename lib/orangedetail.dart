import 'package:detectnew/detect.dart';
import 'package:detectnew/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:detectnew/utils.dart';

class orangedetails extends StatelessWidget {
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
                'assets/images/orangedetail.jpg',
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
                          text: '18°C-29°C    ',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 32 * ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2125 * ffem / fem,
                            color: Color.fromARGB(255, 237, 237, 238),
                          ),
                        ),
                        TextSpan(
                          text: 'Weather',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 25 * ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2125 * ffem / fem,
                            color: Color.fromARGB(255, 133, 217, 232),
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
                        color: Color.fromARGB(255, 250, 251, 252),
                      ),
                      children: [
                        TextSpan(
                          text: 'ORANGE\n\n',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w800,
                            height: 0.6 * ffem / fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                        TextSpan(
                          text:
                              'Orange Trees demand a specific temperature range to prosper. This sweet spot is crucial for their growth cycle, particularly for flowering and fruit development.Orange, Citrus sinensis, is an evergreen tree in the family Rutaceae grown for its edible fruit. Orange trees can grow to a height of 6–15 m (16–49 ft) and can live for periods in excess of 100 years. Most plantations have an economic lifespan of around 30 years.',
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
