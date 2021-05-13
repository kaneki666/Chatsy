import 'package:chatsy/screens/auth/otp/components/body.dart';
import 'package:flutter/material.dart';

class Otp extends StatelessWidget {
  const Otp({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpBody(phoneNumber: phoneNumber),
    );
  }
}
