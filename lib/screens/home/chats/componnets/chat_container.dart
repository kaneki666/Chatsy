import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/chat/chat.dart';
import 'package:chatsy/screens/home/chats/models/users.dart';
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
        child: Container(
          height: 120,
          width: size.width - 15,
          decoration: BoxDecoration(
            color: textWhite,
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
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  width: size.width * 0.50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "${userData.username}",
                          style: GoogleFonts.blackHanSans(
                              fontSize: 18, letterSpacing: 1.2),
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
                              padding: const EdgeInsets.only(bottom: 10.0),
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
                                style: TextStyle(fontSize: 12, color: textSent),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                '${userData.timesent}',
                style: TextStyle(fontSize: 12, color: textTime),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
