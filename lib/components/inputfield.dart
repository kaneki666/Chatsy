import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({
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
        width: size.width * 0.8,
        child: TextField(
          style: TextStyle(
            color: textWhite,
            letterSpacing: 1.4,
          ),
          decoration: InputDecoration(
              filled: true,
              fillColor: inputBg.withOpacity(0.35),
              contentPadding: const EdgeInsets.symmetric(vertical: 25.0),
              hintStyle: TextStyle(
                color: textWhite,
                letterSpacing: 1.4,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Icon(
                  icon,
                  size: 18,
                  color: textWhite,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide:
                    BorderSide(color: inputBg.withOpacity(0.3), width: 0.0),
              ),
              hintText: hintText),
        ),
      ),
    );
  }
}
