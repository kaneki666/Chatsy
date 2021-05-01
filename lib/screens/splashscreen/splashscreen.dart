import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: primary,
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Image.asset(
                  "assets/icons/logo.png",
                  height: 140,
                  width: 140,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Chatsy",
                  style: GoogleFonts.blackHanSans(
                    fontStyle: FontStyle.normal,
                    color: textWhite,
                    fontSize: 50,
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
