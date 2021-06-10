import 'package:chatsy/screens/home/home_screen/models/users.dart';
import 'package:chatsy/screens/home/status/index.dart';
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
    String image =
        'https://bangabandhuolympiad.com/8/English%201st%20Paper.jpg';
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
          StatusItem(size: size, image: image),
        ],
      ),
    );
  }
}

class StatusItem extends StatelessWidget {
  const StatusItem({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Status(image: image),
                        ),
                      );
                    },
                    child: Hero(
                      tag: "status-image",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(image,
                            height: 140,
                            width: size.width * 0.9,
                            fit: BoxFit.fill),
                      ),
                    ),
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
    );
  }
}
