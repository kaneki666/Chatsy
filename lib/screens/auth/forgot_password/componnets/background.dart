import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';

class ForgetBackground extends StatelessWidget {
  final Widget child;
  final Widget child2;
  final AnimationController controller;
  final Animation<double> translateY;

  const ForgetBackground({
    Key? key,
    required this.child,
    required this.child2,
    required this.translateY,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
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
                  return Transform.translate(
                    offset: Offset(
                      translateY.value,
                      0,
                    ),
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
                            "assets/icons/forget.png",
                            height: size.width / 2.3,
                            width: size.width / 2.3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Set up new password!",
                            style: TextStyle(
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
              top: size.height * 0.45,
              child: child,
            ),
            Positioned(
              top: size.height * 0.85,
              child: child2,
            )
          ],
        ));
  }
}
