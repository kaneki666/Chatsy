import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/chats/models/users.dart';
import 'package:flutter/material.dart';

class FriendsRow extends StatelessWidget {
  const FriendsRow({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: transparentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              Icons.search_outlined,
              size: 30,
              color: textWhite,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: size.width * 0.77,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: usersData.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "${usersData[index].image}",
                  height: 50,
                  width: 50,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Padding(
              padding: EdgeInsets.only(left: 5),
            ),
          ),
        ),
      ],
    );
  }
}
