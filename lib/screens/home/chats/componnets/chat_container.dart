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
    PageRouteBuilder _pageRouteBuilder() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return Chat();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
              Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero),
            ),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: Offset(-1.0, 0.0),
              ).animate(secondaryAnimation),
              child: child,
            ),
          );
          // return ScaleTransition(
          //   scale: animation.drive(
          //     Tween<double>(begin: 0.0, end: 1.0).chain(
          //       CurveTween(
          //         curve: Interval(0.0, 0.5, curve: Curves.elasticIn),
          //       ),
          //     ),
          //   ),
          //   child: ScaleTransition(
          //     scale: Tween<double>(begin: 1.5, end: 1.0).animate(
          //       CurvedAnimation(
          //         parent: animation,
          //         curve: Interval(0.5, 1.0, curve: Curves.elasticInOut),
          //       ),
          //     ),
          //     child: child,
          //   ),
          // );
          // return ScaleTransition(
          //   scale:
          //       CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
          //   child: child,
          // );
        },
        transitionDuration: const Duration(milliseconds: 500),
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(context, _pageRouteBuilder());
      },
      child: Padding(
        padding: EdgeInsets.all(5),
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
                padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
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
                width: size.width * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  width: size.width * 0.40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${userData.username}",
                        style: GoogleFonts.blackHanSans(
                            fontSize: 18, letterSpacing: 1.2),
                      ),
                      Text(
                        "${userData.message}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      userData.messagesent == true
                          ? Row(
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
                                  style:
                                      TextStyle(fontSize: 12, color: iconSeen),
                                ),
                              ],
                            )
                          : Text(
                              '2 mint ago',
                              style: TextStyle(fontSize: 12, color: textSent),
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
