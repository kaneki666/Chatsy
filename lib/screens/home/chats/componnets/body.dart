import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/chats/componnets/chat_container.dart';
import 'package:chatsy/screens/home/chats/componnets/topview_chats.dart';
import 'package:chatsy/screens/home/chats/models/users.dart';
import 'package:flutter/material.dart';

class ChatsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: primary,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.25,
            width: size.width,
            child: TopViewChats(size: size),
          ),
          SizedBox(
            height: size.height * 0.75,
            width: size.width,
            child: Container(
              decoration: BoxDecoration(
                color: textWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.038),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: usersData.length,
                  itemBuilder: (context, index) {
                    return ChatContainer(
                      userData: usersData[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
