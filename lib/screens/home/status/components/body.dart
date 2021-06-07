import 'package:chatsy/components/body.dart';
import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/home_screen/models/users.dart';
import 'package:flutter/material.dart';

class StatusBody extends StatelessWidget {
  const StatusBody({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String? image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BodyComponent(
        child: Container(
      child: Column(
        children: [
          Hero(
            tag: "status-image",
            child: FadeInImage.assetNetwork(
              placeholder: "assets/icons/loading.gif",
              image: "$image",
              height: size.height * 0.3,
              width: size.width,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.height * 0.01),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    '${usersData[2].image}',
                    height: 40,
                    width: 40,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      '${usersData[2].username}',
                      style: TextStyle(color: textDark, fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    '1 hour ago',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            height: size.height * 0.67 - 40,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Comment(commentData: usersData[0]),
                  Comment(commentData: usersData[1]),
                  Comment(commentData: usersData[3]),
                  Comment(commentData: usersData[4]),
                  Comment(commentData: usersData[5]),
                  Comment(commentData: usersData[6]),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

// ignore: must_be_immutable
class Comment extends StatelessWidget {
  Comment({
    Key? key,
    required this.commentData,
  }) : super(key: key);

  User commentData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      '${commentData.image}',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        '${commentData.username}',
                        style: TextStyle(color: textDark, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      stops: [0.0, 0.5, 1.0],
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      tileMode: TileMode.repeated,
                      colors: [
                        Color(0xff7b72c5),
                        Color(0xff7f7fd9),
                        Color(0xff8389e9),
                      ], // red to yellow
                      // repeats the gradient over the canvas
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Lovely picture bring back lovely memories, went there on my way to see my son & family.",
                      style: TextStyle(color: textWhite),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 0,
                      ),
                      child: Text(
                        '1 hour ago',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 100,
                      ),
                      child: Text(
                        'Like',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        'Reply',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.22),
                      child: Row(
                        children: [
                          Text(
                            "2",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Icon(
                            Icons.favorite,
                            size: 12,
                            color: Colors.pinkAccent,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
