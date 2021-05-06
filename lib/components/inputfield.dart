import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 25),
      child: Container(
        height: 60,
        width: size.width > 500 ? 300 : size.width - 100,
        child: TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              hintStyle: TextStyle(
                fontSize: 16.0,
                color: placeholderText,
                letterSpacing: 1.4,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Icon(
                  icon,
                  size: 22,
                  color: iconColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: primaryLight, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
