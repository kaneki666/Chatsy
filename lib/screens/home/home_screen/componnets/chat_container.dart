import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/chat/chat.dart';
import 'package:chatsy/screens/home/home_screen/models/users.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final User userData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double itemHeight = size.height * 0.18;
    double imageSize = size.width * 0.2;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Chat(userData: userData),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(2.5),
        child: Column(
          children: [
            Container(
              height: itemHeight,
              width: size.width - 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 5, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "${userData.image}",
                        height: imageSize,
                        width: imageSize,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: SizedBox(
                      width: size.width * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "${userData.username}",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: textDark,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            "${userData.message}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          userData.messagesent == true
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye_outlined,
                                        size: 20,
                                        color: iconSeen,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '2 mint ago',
                                        style: TextStyle(
                                            fontSize: 12, color: iconSeen),
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    '2 mint ago',
                                    style: TextStyle(
                                        fontSize: 12, color: textSent),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }
}
