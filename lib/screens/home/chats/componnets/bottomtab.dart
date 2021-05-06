import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomTab extends StatelessWidget {
  const BottomTab({
    Key? key,
    required this.itemWidth,
  }) : super(key: key);

  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 61.1,
        child: Row(
          children: [
            Container(
              width: itemWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Chats",
                    style: GoogleFonts.blackHanSans(
                      fontStyle: FontStyle.normal,
                      color: primary,
                      fontSize: 22,
                    ),
                  ),
                  ClipOval(
                    child: Container(
                      height: 8,
                      width: 8,
                      color: primary,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: itemWidth,
              child: Icon(
                Icons.search,
                size: 30,
                color: primary,
              ),
            ),
            Container(
              width: itemWidth,
              height: 100,
              child: Container(
                child: ClipOval(
                  child: Container(
                    color: primary,
                    width: 30,
                    height: 30,
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: textWhite,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: itemWidth,
              child: Icon(
                Icons.supervised_user_circle_sharp,
                size: 30,
                color: primary,
              ),
            ),
            Container(
              width: itemWidth,
              child: Icon(
                Icons.phone,
                size: 30,
                color: primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
