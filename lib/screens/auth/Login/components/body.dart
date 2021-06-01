import 'package:chatsy/components/button_primary.dart';
import 'package:chatsy/screens/auth/Login/components/background.dart';
import 'package:chatsy/screens/auth/forgot_password/forgot_passsword.dart';
import 'package:chatsy/screens/auth/signup/signup.dart';
import 'package:chatsy/screens/home/home.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:chatsy/components/inputfield.dart';
import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody>
    with SingleTickerProviderStateMixin {
  KeyboardVisibilityController keyboardVisibilityController =
      KeyboardVisibilityController();

  late AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );

  late Animation<double> translateY = Tween<double>(
    begin: 0,
    end: -100,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.ease,
      ),
    ),
  );

  late Animation<double> opacity = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.0,
        0.5,
        curve: Curves.easeOut,
      ),
    ),
  );

  Future _startAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible == true) {
        _startAnimation();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      opacity: opacity,
      controller: _controller,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, translateY.value),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InputField(
                  hintText: "Username",
                  icon: Icons.person_outline,
                ),
                InputField(hintText: "Password", icon: Icons.lock_outline),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return FogotPassword();
                            },
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "FORGOT?",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.blackHanSans(
                            fontStyle: FontStyle.normal,
                            color: textWhite.withOpacity(0.6),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      child2: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Home();
                }),
              );
            },
            child: ButtonPrimary(
              size: size,
              text: "LOGIN",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account!",
                  style: GoogleFonts.blackHanSans(
                    fontStyle: FontStyle.normal,
                    color: textWhite.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Signup();
                        },
                      ),
                    );
                  },
                  child: Text(
                    " Signup",
                    style: GoogleFonts.blackHanSans(
                      fontStyle: FontStyle.normal,
                      color: textWhite,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
