import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/chat/components/top_container.dart';
import 'package:chatsy/screens/home/home_screen/models/users.dart';

import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final User userData;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.0, 1.0],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          tileMode: TileMode.repeated,
          colors: [bgHome1, bgHome2], // red to yellow
          // repeats the gradient over the canvas
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: size.height * 0.1,
            width: size.width,
            child: ChatTopContainer(size: size, userData: userData),
          ),
          SizedBox(
            height: size.height * 0.70,
            width: size.width,
            child: Container(
              child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      MessageContainerReciever(
                        userData: userData,
                        message: "oii kiros?",
                      ),
                      MessageContainerSender(
                        userData: userData,
                        message: "khai? tui kiros?",
                      ),
                      MessageContainerReciever(
                        userData: userData,
                        message: "khai? tui kiros?",
                      ),
                      MessageContainerSender(
                        userData: userData,
                        message: "Ho ashmu? koi ashbe?",
                      ),
                      MessageContainerReciever(
                        userData: userData,
                        message: "Khulshi 1 ay? sondhey",
                      ),
                      MessageContainerSender(
                        userData: userData,
                        message: "ok call dis",
                      ),
                      MessageContainerReciever(
                        userData: userData,
                        message: "oii kiros?",
                      ),
                      MessageContainerSender(
                        userData: userData,
                        message: "khai? tui kiros?",
                      ),
                      MessageContainerReciever(
                        userData: userData,
                        message: "khai? tui kiros?",
                      ),
                      MessageContainerSender(
                        userData: userData,
                        message: "Ho ashmu? koi ashbe?",
                      ),
                      MessageContainerReciever(
                        userData: userData,
                        message: "Khulshi 1 ay? sondhey",
                      ),
                      MessageContainerSender(
                        userData: userData,
                        message: "ok call dis",
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: size.height * .2,
            width: double.infinity,
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Container(
                            color: textWhite,
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.mic_outlined,
                              color: textBlack,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: size.width * 0.65,
                          height: 50,
                          decoration: BoxDecoration(
                              color: chatContainerBg,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  color: placeholderText,
                                  height: 1,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'type here'),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ClipOval(
                          child: Container(
                            color: textWhite,
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.send,
                              color: textBlack,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 8, bottom: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipOval(
                          child: Container(
                            color: Color(0xFF0169ff),
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.image,
                              color: textWhite,
                              size: 20,
                            ),
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            color: Color(0xFFab1df7),
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.file_upload,
                              color: textWhite,
                              size: 20,
                            ),
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            color: Color(0xFFfe5001),
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.contact_phone,
                              color: textWhite,
                              size: 20,
                            ),
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            color: Color(0xFFff00a3),
                            height: 35,
                            width: 35,
                            child: Icon(
                              Icons.location_on,
                              color: textWhite,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MessageContainerReciever extends StatelessWidget {
  const MessageContainerReciever({
    Key? key,
    required this.userData,
    required this.message,
  }) : super(key: key);

  final User userData;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(
              '${userData.image}',
              height: 50,
              width: 50,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 35,
              minWidth: 60,
              maxWidth: 235,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: chatContainerBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "10.30 AM",
            style: TextStyle(fontSize: 10, color: Colors.grey.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}

class MessageContainerSender extends StatelessWidget {
  const MessageContainerSender({
    Key? key,
    required this.userData,
    required this.message,
  }) : super(key: key);

  final User userData;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "10.30 AM",
            style: TextStyle(fontSize: 10, color: Colors.grey.withOpacity(0.8)),
          ),
          SizedBox(
            width: 10,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 35,
              minWidth: 60,
              maxWidth: 235,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: chatContainerBg,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(message),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ClipOval(
            child: Image.asset(
              'assets/images/2.jpg',
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
}
