import 'package:flutter/material.dart';
import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/home_screen/componnets/top_view.dart';

class HomeScreenBody extends StatefulWidget {
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  ScrollController _scroller = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   print(_scroller.toString());
  // }

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
            padding: EdgeInsets.only(left: size.width * 0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                    color: textWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
                TopView(),
                TopView(),
                TopView(),
                TopView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
