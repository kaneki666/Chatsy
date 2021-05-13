import 'dart:ffi';

import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  late final Animation<double> opacity = Tween(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.0,
        0.100,
        curve: Curves.ease,
      ),
    ),
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
            colors: [bgLight, bglDark], // red to yellow
            // repeats the gradient over the canvas
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: size.height * 0.1,
              child: ScaleTransition(
                scale: _animation,
                child: Image.asset(
                  "assets/icons/logo.png",
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.4,
              child: Text(
                "Hi, I'm Chatsy",
                style: GoogleFonts.blackHanSans(
                  color: textWhite,
                  fontSize: 35,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.5,
              child: Text(
                "Your new chat App",
                style: GoogleFonts.blackHanSans(
                  color: textWhite.withOpacity(0.6),
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.8,
              child: Container(
                width: size.width * 0.5,
                height: 50,
                decoration: BoxDecoration(
                  color: textWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "SIGN UP",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.blackHanSans(
                      color: bglDark,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.9,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                },
                child: Text(
                  "I ALREADY HAVE AN ACCOUNNT",
                  style: GoogleFonts.blackHanSans(
                    color: textWhite.withOpacity(0.6),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
