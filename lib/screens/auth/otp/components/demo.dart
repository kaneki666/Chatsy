import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/Login/login.dart';
import 'package:chatsy/screens/auth/otp/components/otp_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class OtpBody extends StatefulWidget {
  const OtpBody({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;

  @override
  _OtpBodyState createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  // @override
  // void initState() {
  //   super.initState();
  //   _listenOtp();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void otpVerify() async {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+88${widget.phoneNumber}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) async {
          Future<void> _showMyDialog() async {
            return showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('failed'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('This is a demo alert dialog.'),
                        Text('Would you like to approve of this message?'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Approve'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }

          _showMyDialog();
        },
        codeSent: (String? verificationId, int? resendToken) async {},
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }

    otpVerify();

    return Container();
  }
}

// void _listenOtp() async {
//   await SmsAutoFill().listenForCode;
// }
