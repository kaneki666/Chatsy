import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/chats/models/users.dart';
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
      padding: EdgeInsets.only(top: size.height * 0.06),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: iconColor,
                size: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${userData.username}",
                style: GoogleFonts.blackHanSans(
                    color: textWhite, fontSize: 20, letterSpacing: 1.2),
              ),
              ClipOval(
                child: Image.asset(
                  '${userData.image}',
                  height: 50,
                  width: 50,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 20,
            child: Icon(
              Icons.info_outline_rounded,
              color: iconColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
