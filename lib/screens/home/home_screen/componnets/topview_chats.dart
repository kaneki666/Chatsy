import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/home_screen/componnets/friends_row.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopViewChats extends StatelessWidget {
  const TopViewChats({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: size.height * 0.05, left: size.height * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Chat with friends",
            style: GoogleFonts.blackHanSans(
              fontStyle: FontStyle.normal,
              color: textHeader,
              fontSize: size.height * 0.04,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FriendsRow(size: size),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Text(
          //       "Chats",
          //       style: GoogleFonts.blackHanSans(
          //         fontStyle: FontStyle.normal,
          //         color: textDark,
          //         fontSize: 20,
          //       ),
          //     ),
          //     Text(
          //       "Calls",
          //       style: GoogleFonts.blackHanSans(
          //         fontStyle: FontStyle.normal,
          //         color: textDark.withOpacity(0.7),
          //         fontSize: 20,
          //       ),
          //     ),
          //     Text(
          //       "Groups",
          //       style: GoogleFonts.blackHanSans(
          //         fontStyle: FontStyle.normal,
          //         color: textDark.withOpacity(0.7),
          //         fontSize: 20,
          //       ),
          //     ),
          //     Text(
          //       "Friends",
          //       style: GoogleFonts.blackHanSans(
          //         fontStyle: FontStyle.normal,
          //         color: textDark.withOpacity(0.7),
          //         fontSize: 20,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
