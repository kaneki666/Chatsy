import 'package:chatsy/components/button_primary.dart';
import 'package:chatsy/screens/auth/Login/components/background.dart';
import 'package:chatsy/screens/auth/forgot_password/forgot_passsword.dart';
import 'package:chatsy/screens/auth/signup/signup.dart';
import 'package:chatsy/screens/home/home.dart';
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
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  );

  late Animation<double> translateY = Tween<double>(
    begin: 0,
    end: -100,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.25,
        1.0,
        curve: Curves.fastOutSlowIn,
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
        0.2,
        curve: Curves.fastOutSlowIn,
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
      child:
          LoginAnimatedBuilder(controller: _controller, translateY: translateY),
      child2: Column(
        children: [
          LoginButton(size: size),
          SignupButton(size: size),
        ],
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account!",
            style: TextStyle(
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
              style: TextStyle(
                fontStyle: FontStyle.normal,
                color: textWhite,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}

class LoginAnimatedBuilder extends StatelessWidget {
  const LoginAnimatedBuilder({
    Key? key,
    required AnimationController controller,
    required this.translateY,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;
  final Animation<double> translateY;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
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
                        style: TextStyle(
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
    );
  }
}
