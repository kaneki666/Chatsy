import 'package:chatsy/constants/constants.dart';

import 'package:chatsy/screens/home/home_screen/componnets/home_bottom_sheet.dart';
import 'package:flutter/material.dart';

class TopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.05),
      child: Container(
        height: size.height * 0.32,
        child: Stack(
          children: [
            Positioned(
              left: 30,
              child: Text(
                "Hello",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: textHeader,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              top: 30,
              left: 30,
              child: Text(
                "Mohammad",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: textDark,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            homeBotomSheet(context, size),
          ],
        ),
      ),
    );
  }
}
