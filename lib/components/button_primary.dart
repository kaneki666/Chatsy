import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.5,
      height: 50,
      decoration: BoxDecoration(
        color: textWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: bglDark,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
