import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;
  final Widget child2;
  final AnimationController controller;
  final Animation<double> opacity;
  const LoginBackground({
    Key? key,
    required this.child,
    required this.child2,
    required this.opacity,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        height: size.height,
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
              top: size.height * 0.05,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: opacity.value,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: size.width * 0.83),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: textWhite,
                              size: 20,
                            ),
                          ),
                        ),
                        Hero(
                          tag: 'tag-image-image',
                          child: Image.asset(
                            "assets/icons/logo.png",
                            height: 80,
                            width: 80,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.03),
                          child: Text(
                            "Welcome Back!",
                            style: GoogleFonts.blackHanSans(
                              fontStyle: FontStyle.normal,
                              color: textWhite.withOpacity(0.5),
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: size.height * 0.35,
              child: child,
            ),
            Positioned(
              top: size.height * 0.8,
              child: child2,
            )
          ],
        ));
  }
}
