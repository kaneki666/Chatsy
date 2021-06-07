import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/home_screen/componnets/activity_home.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Positioned homeBotomSheet(BuildContext context, Size size) {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
  }

  return Positioned(
    top: 70,
    left: 100,
    child: GestureDetector(
      onTap: () => showMaterialModalBottomSheet(
        context: context,
        backgroundColor: inputBg,
        barrierColor: inputBg,
        builder: (BuildContext context) {
          return Container(
            height: size.height * 0.95,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                stops: [0.0, 0.6, 0.9],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                tileMode: TileMode.clamp,
                colors: [gradient3, gradient1, gradient2], // red to yellow
                // repeats the gradient over the canvas
              ),
            ),
            child: Column(
              children: [
                Container(
                    height: size.height * 0.1,
                    child: IconButton(
                      icon: Icon(Icons.ac_unit),
                      onPressed: () => _selectDate(context),
                    )),
                Image.asset(
                  "assets/icons/logo.png",
                  height: 100,
                  width: 100,
                  scale: 2,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "What are you upto today?",
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: textWhite,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        },
      ),
      child: ActivityHome(size: size),
    ),
  );
}
