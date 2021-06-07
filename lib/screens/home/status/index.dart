import 'package:chatsy/screens/home/status/components/body.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StatusBody(image: image));
  }
}
