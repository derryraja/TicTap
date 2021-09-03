import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictap/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  static var myNewFont = GoogleFonts.montserrat(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.montserrat(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text(
                        "TIC TAP",
                        style: myNewFontWhite.copyWith(fontSize: 30),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: AvatarGlow(
                        endRadius: 140,
                        duration: Duration(seconds: 2),
                        glowColor: Colors.blue,
                        repeat: true,
                        repeatPauseDuration: Duration(seconds: 1),
                        startDelay: Duration(seconds: 1),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                style: BorderStyle.none,
                              ),
                              shape: BoxShape.circle),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[900],
                            child: Container(
                              child: Image.asset(
                                'assets/app_icon_circle.png',
                                fit: BoxFit.scaleDown,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.black),
                            ),
                            radius: 90.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 40, right: 40, bottom: 30, top: 120),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(25),
                          color: Colors.blue,
                          child: Center(
                            child: Text('PLAY GAME',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 3))),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        child: Text(
                          "Made with 💙 by Derry",
                          style: GoogleFonts.montserrat(
                              fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
