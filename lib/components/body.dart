import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BodyComponent extends StatelessWidget {
  BodyComponent({Key? key, required this.child}) : super(key: key);

  Widget? child;

  @override
  Widget build(BuildContext context) {
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
      child: child,
    );
  }
}
