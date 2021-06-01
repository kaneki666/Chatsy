import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    Key? key,
    required this.lastnode,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  final bool lastnode;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double itemSize = (size.width / 6) - 18;
    var focusNode = FocusNode();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: itemSize,
        height: itemSize,
        child: TextField(
          style: TextStyle(
            color: textWhite,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: inputBg.withOpacity(0.35),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(color: inputBg.withOpacity(0.3), width: 0.0),
            ),
          ),
          textAlign: TextAlign.center,
          controller: controller,
          focusNode: focusNode,
          onChanged: (v) {
            if (lastnode == false) {
              if (v.length == 1) {
                focusNode.nextFocus();
              }
            }
          },
        ),
      ),
    );
  }
}
