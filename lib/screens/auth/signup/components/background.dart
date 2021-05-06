import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupBackground extends StatelessWidget {
  final Widget child;
  const SignupBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: primary,
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  Hero(
                    tag: 'image-logo',
                    child: Image.asset(
                      'assets/icons/logo.png',
                      height: size.height * 0.16,
                      width: size.height * 0.16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "Chatsy",
                      style: GoogleFonts.blackHanSans(
                        fontStyle: FontStyle.normal,
                        color: textWhite,
                        fontSize: size.height * 0.05,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.3,
            child: Container(
              height: size.height * 0.7,
              width: size.width,
              decoration: BoxDecoration(
                color: bgWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
