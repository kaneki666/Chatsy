import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/Login/login.dart';
import 'package:chatsy/screens/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatsy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme:
              GoogleFonts.dmSansTextTheme().apply(displayColor: textWhite),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
              brightness: Brightness.light)),
      home: Login(),
    );
  }
}
