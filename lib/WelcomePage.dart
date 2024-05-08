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
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/welcome1.png'),
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(17 * fem, 117 * fem, 17 * fem, 206 * fem), // Adjusted top padding for Welcome text
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5 * fem, 0 * fem, 0 * fem, 10 * fem), // Adjusted bottom margin for Welcome text
                    constraints: BoxConstraints(
                      maxWidth: 319 * fem,
                    ),
                    child: TextStrokeWidget(
                      "Welcome to Banana",
                      fontFamily: 'Inter',
                      fontSize: 34 * ffem,
                      strokeWidth: 8, // Adjust stroke width as needed
                      strokeColor: Color.fromARGB(255, 9, 9, 9), // Set stroke color to black
                      fontWeight: FontWeight.w900, // Increased font weight
                      shadow: [
                        Shadow(
                          blurRadius: 2,
                          color: Color.fromARGB(255, 135, 42, 42),
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 260 * fem), // Adjusted bottom margin for Plant Care text
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextStrokeWidget(
                        'Plant',
                        key: Key('plant_text'), // Unique key for the "Plant" text
                        fontFamily: 'Inter',
                        fontSize: 34 * ffem,
                        strokeWidth: 8, // Adjust stroke width as needed
                        strokeColor: Color.fromARGB(255, 12, 12, 12), // Set stroke color to desired color
                        fontWeight: FontWeight.bold, // Increased font weight
                        shadow: [
                          Shadow(
                            blurRadius: 2,
                            color: Color.fromARGB(255, 135, 42, 42),
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      SizedBox(width: 7 * fem), // Add some space between words
                      TextStrokeWidget(
                        'Care',
                        key: Key('care_text'), // Unique key for the "Care" text
                        fontFamily: 'Inter',
                        fontSize: 32 * ffem,
                        strokeWidth: 8, // Adjust stroke width as needed
                        strokeColor: Color.fromARGB(255, 12, 12, 12), // Set stroke color to desired color
                        fontWeight: FontWeight.w900, // Increased font weight
                        shadow: [
                          Shadow(
                            blurRadius: 2,
                            color: Color.fromARGB(255, 135, 42, 42),
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1 * fem), // Add some space between the text and the next widget
                Container(
                  margin: EdgeInsets.fromLTRB(15 * fem, 0 * fem, 0 * fem, 41 * fem),
                  child: Text(
                    'KEEP YOUR PLANT HEALTHY',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 27 * ffem,
                      fontWeight: FontWeight.w900,
                      height: 1.2125 * ffem / fem,
                      color: Color.fromARGB(255, 10, 7, 1),
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
                    margin: EdgeInsets.fromLTRB(52 * fem, 0 * fem, 51 * fem, 0 * fem),
                    width: double.infinity,
                    height: 82 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40 * fem),
                      gradient: LinearGradient(
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[
                          Color.fromARGB(255, 19, 218, 39),
                          Color(0xff000000)
                        ],
                        stops: <double>[0, 1],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontFamily: 'Inter',
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



class TextStrokeWidget extends StatelessWidget {
  final String text;
  final String fontFamily;
  final bool overrideSizeStroke;
  final double fontSize;
  final double strokeWidth;
  final Color strokeColor;
  final FontWeight fontWeight;
  final List<Shadow> shadow;
  final Color color;

  const TextStrokeWidget(
  this.text, {
  Key? key = const Key(''), // Provide a non-null default value
  required this.fontFamily,
  this.overrideSizeStroke = false,
  this.fontSize = 20,
  this.strokeWidth = 0,
  this.strokeColor = Colors.white,
   this.fontWeight = FontWeight.normal,
  this.shadow = const [],
  this.color = const Color.fromARGB(255, 237, 239, 238),
}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    // to make a stroke text we need stack between 2 text..
    // 1 for text & one for stroke effect
    return Stack(
      // redundant right?
      // same effect & lest code later.. :)
      children: List.generate(2, (index) {
        // let declare style for text .. :)
        // index == 0 for effect

        TextStyle textStyle = index == 0
            ? TextStyle(
                fontFamily: this.fontFamily,
                fontSize: this.fontSize,
                shadows: this.shadow,
                foreground: Paint()
                  ..color = this.strokeColor
                  ..strokeWidth = this.strokeWidth
                  ..strokeCap = StrokeCap.round
                  ..strokeJoin = StrokeJoin.round
                  ..style = PaintingStyle.stroke,
              )
            : TextStyle(
                fontFamily: this.fontFamily,
                fontSize: this.fontSize,
                color: this.color,
              );

        // let disable stroke effect if this.strokeWidth == 0
        return Offstage(
          offstage: this.strokeWidth == 0 &&
              index == 0, // put index == 0 so just disable effect only.. yeayy
          child: Text(
            this.text,
            style: textStyle,
          ),
        );
      }).toList(),
    );
  }
}

