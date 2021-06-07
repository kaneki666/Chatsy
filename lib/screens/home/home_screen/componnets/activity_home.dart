import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';

class ActivityHome extends StatelessWidget {
  const ActivityHome({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.7,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.0, 0.5, 1.0],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
          tileMode: TileMode.repeated,
          colors: [gradient1, gradient2, gradient3], // red to yellow
          // repeats the gradient over the canvas
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: -20,
            child: Icon(
              Icons.ac_unit,
              color: textHeader.withOpacity(0.4),
              size: 100,
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            left: 20,
            child: Text(
              "What are you doing now?",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: textWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: size.height * 0.14,
            left: 20,
            child: Text(
              "Share",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: textDark.withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
