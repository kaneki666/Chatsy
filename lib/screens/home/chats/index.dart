import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/home_screen/componnets/chat_container.dart';
import 'package:chatsy/screens/home/home_screen/componnets/friends_row.dart';
import 'package:chatsy/screens/home/home_screen/models/users.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: size.height,
      // width: double.infinity,
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
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: FriendsRow(
              size: size,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ChatContainer(userData: usersData[0]),
          ChatContainer(userData: usersData[1]),
          ChatContainer(userData: usersData[2]),
          ChatContainer(userData: usersData[3]),
          ChatContainer(userData: usersData[4]),
          ChatContainer(userData: usersData[5]),
          ChatContainer(userData: usersData[6]),
          ChatContainer(userData: usersData[7]),
        ],
      ),
    );
  }
}
