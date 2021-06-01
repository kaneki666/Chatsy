import 'package:chatsy/components/button_primary.dart';
import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/Login/login.dart';
import 'package:chatsy/screens/auth/otp/components/otp_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController code1 = TextEditingController();
    TextEditingController code2 = TextEditingController();
    TextEditingController code3 = TextEditingController();
    TextEditingController code4 = TextEditingController();
    TextEditingController code5 = TextEditingController();
    TextEditingController code6 = TextEditingController();
    return Container(
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.0, 1.0],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          tileMode: TileMode.repeated,
          colors: [bgLight, bglDark], // red to yellow
          // repeats the gradient over the canvas
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: size.height * 0.06,
            child: Text(
              "Code is sent to 01764225218",
              style: GoogleFonts.blackHanSans(
                fontStyle: FontStyle.normal,
                color: textWhite.withOpacity(0.5),
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.08,
            child: Image.asset(
              "assets/icons/otp.png",
              height: size.width / 1.8,
              width: size.width / 1.8,
            ),
          ),
          Positioned(
            top: size.height * 0.4,
            child: Text(
              "Verify OTP!",
              style: GoogleFonts.blackHanSans(
                fontStyle: FontStyle.normal,
                color: textWhite.withOpacity(0.5),
                fontSize: 35,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.48,
            child: Row(
              children: [
                OtpField(
                  lastnode: false,
                  controller: code1,
                ),
                OtpField(
                  lastnode: false,
                  controller: code2,
                ),
                OtpField(
                  lastnode: false,
                  controller: code3,
                ),
                OtpField(
                  lastnode: false,
                  controller: code4,
                ),
                OtpField(
                  lastnode: false,
                  controller: code5,
                ),
                OtpField(
                  lastnode: true,
                  controller: code6,
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't get the OTP?",
                  style: GoogleFonts.blackHanSans(
                    fontStyle: FontStyle.normal,
                    color: textWhite.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                      ),
                    );
                  },
                  child: Text(
                    " Send Again",
                    style: GoogleFonts.blackHanSans(
                      fontStyle: FontStyle.normal,
                      color: textWhite,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.84,
            child: ButtonPrimary(
              size: size,
              text: "Verify",
            ),
          )
        ],
      ),
    );
  }
}
