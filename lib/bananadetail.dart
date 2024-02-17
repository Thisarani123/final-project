import 'package:detectnew/detect.dart';
import 'package:detectnew/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:detectnew/utils.dart';

class bananadetails extends StatelessWidget {
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
                'assets/images/bananadetail.png',
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
                          text: '26°C-28°C    ',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 32 * ffem,
                            fontWeight: FontWeight.w800,
                            height: 1.2125 * ffem / fem,
                            color: Color.fromARGB(255, 131, 239, 245),
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
                          text: 'BANANA\n\n',
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
                              'A banana is a curved, yellow fruit with a thick skin and soft sweet flesh. A banana is a tropical fruit that is quite popular all over the world. It grows in bunches on a banana tree.The banana plant is a gigantic herb that springs from an underground stem, or rhizome, to form a false trunk 3–6 metres (10–20 feet) high. This trunk is composed of the basal portions of leaf sheaths and is crowned with a rosette of 10 to 20 oblong to elliptic leaves that sometimes attain a length of 3–3.5 metres (10–11.5 feet) and a breadth of 65 cm (26 inches).  ',
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
