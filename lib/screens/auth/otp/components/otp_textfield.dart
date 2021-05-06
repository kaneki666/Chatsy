import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 60,
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              fontSize: 18.0,
              color: placeholderText,
              letterSpacing: 1.6,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: primaryLight, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
