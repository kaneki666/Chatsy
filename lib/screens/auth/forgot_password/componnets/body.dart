import 'package:chatsy/components/button_primary.dart';
import 'package:chatsy/components/inputfield.dart';

import 'package:chatsy/screens/auth/forgot_password/componnets/background.dart';
import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class ForgetBody extends StatefulWidget {
  @override
  _ForgetBodyState createState() => _ForgetBodyState();
}

class _ForgetBodyState extends State<ForgetBody>
    with SingleTickerProviderStateMixin {
  KeyboardVisibilityController keyboardVisibilityController =
      KeyboardVisibilityController();

  late AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
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
    late Animation<double> translateY = Tween<double>(
      begin: 0,
      end: -size.width,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1,
          curve: Curves.easeOut,
        ),
      ),
    );
    late Animation<double> translateYBody = Tween<double>(
      begin: 0,
      end: -size.height * 0.35,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1,
          curve: Curves.ease,
        ),
      ),
    );
    return ForgetBackground(
      controller: _controller,
      translateY: translateY,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, translateYBody.value),
            child: Column(
              children: [
                InputField(
                  icon: Icons.phone_android_outlined,
                  hintText: "Registered Phone",
                ),
                InputField(
                  icon: Icons.lock_outlined,
                  hintText: "New Password",
                ),
                InputField(
                  icon: Icons.lock_open_outlined,
                  hintText: "Confirm Password",
                ),
              ],
            ),
          );
        },
      ),
      child2: Column(
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return Otp();
              //     },
              //   ),
              // );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ButtonPrimary(
                size: size,
                text: "VERIFY OTP",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
