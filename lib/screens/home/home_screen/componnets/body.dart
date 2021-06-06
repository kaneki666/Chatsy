import 'package:chatsy/screens/home/home_screen/models/users.dart';
import 'package:flutter/material.dart';
import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/home_screen/componnets/top_view.dart';

class HomeScreenBody extends StatefulWidget {
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
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
          TopView(),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 250,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: textWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                '${usersData[2].image}',
                                height: 50,
                                width: 50,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                '${usersData[2].username}',
                                style: TextStyle(color: textDark, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: FadeInImage.assetNetwork(
                              placeholder: "assets/icons/loading.gif",
                              image:
                                  "https://images.unsplash.com/photo-1558409057-bbe679023136?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=100",
                              height: 140,
                              width: size.width * 0.9,
                              fit: BoxFit.fill),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.pinkAccent,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text("10"),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.comment_bank,
                                  color: textDark,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text("8 comments"),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
