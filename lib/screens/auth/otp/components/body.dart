import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/Login/login.dart';
import 'package:chatsy/screens/auth/otp/components/otp_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      color: primary,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: size.height * 0.15,
            child: Image.asset(
              "assets/icons/otp.png",
              height: size.width / 1.5,
              width: size.width / 1.5,
            ),
          ),
          Positioned(
            top: size.height * 0.55,
            child: Text(
              "Verify OTP!",
              style: GoogleFonts.blackHanSans(
                fontStyle: FontStyle.normal,
                color: textWhite,
                fontSize: 35,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.65,
            child: Row(
              children: [
                OtpField(),
                OtpField(),
                OtpField(),
                OtpField(),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.78,
            child: GestureDetector(
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
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: buttonBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Verify",
                    style: GoogleFonts.merriweatherSans(
                        fontStyle: FontStyle.normal,
                        color: textWhite,
                        fontSize: 20,
                        letterSpacing: 1.6),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
