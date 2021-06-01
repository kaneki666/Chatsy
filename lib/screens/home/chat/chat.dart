import 'package:chatsy/screens/home/chat/components/body.dart';
import 'package:chatsy/screens/home/home_screen/models/users.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final User userData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatBody(
        userData: userData,
      ),
    );
  }
}
