import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetBackground extends StatelessWidget {
  final Widget child;
  const ForgetBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      color: primary,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 40,
            child: Image.asset(
              "assets/icons/forget.png",
              height: size.width / 1.5,
              width: size.width / 1.5,
            ),
          ),
          Positioned(
            top: size.height * 0.4,
            child: Text(
              "Set up new password!",
              style: GoogleFonts.blackHanSans(
                fontStyle: FontStyle.normal,
                color: textWhite,
                fontSize: 30,
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
