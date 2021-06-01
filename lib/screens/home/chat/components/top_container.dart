import 'package:chatsy/constants/constants.dart';

import 'package:chatsy/screens/home/home_screen/models/users.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatTopContainer extends StatelessWidget {
  const ChatTopContainer({
    Key? key,
    required this.size,
    required this.userData,
  }) : super(key: key);

  final Size size;
  final User userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.04),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: iconColor,
                  size: 20,
                ),
              ),
              Text(
                "${userData.username}",
                style: TextStyle(
                    color: textDark, fontSize: 18, letterSpacing: 1.2),
              ),
              Icon(
                Icons.info_outline_rounded,
                color: iconColor,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
