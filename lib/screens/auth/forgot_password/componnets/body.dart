import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/forgot_password/componnets/background.dart';
import 'package:chatsy/screens/auth/otp/otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ForgetBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.48,
            ),
            TextfieldForget(
              size: size,
              icon: Icons.phone_android_outlined,
              hintText: "Registered Phone",
            ),
            TextfieldForget(
              size: size,
              icon: Icons.lock_outlined,
              hintText: "New Password",
            ),
            TextfieldForget(
              size: size,
              icon: Icons.lock_open_outlined,
              hintText: "Confirm Password",
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return Otp();
                //     },
                //   ),
                // );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 220,
                  decoration: BoxDecoration(
                    color: buttonBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Verify OTP",
                    style: GoogleFonts.merriweatherSans(
                        fontStyle: FontStyle.normal,
                        color: textWhite,
                        fontSize: 20,
                        letterSpacing: 1.6),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextfieldForget extends StatelessWidget {
  const TextfieldForget(
      {Key? key,
      required this.size,
      required this.icon,
      required this.hintText})
      : super(key: key);

  final Size size;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width > 500 ? 300 : size.width - 100,
        height: size.height > 800 ? 60 : 60,
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(
                fontSize: 18.0,
                color: placeholderText,
                letterSpacing: 1.6,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Icon(
                  icon,
                  size: 22,
                  color: iconColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: primaryLight, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
