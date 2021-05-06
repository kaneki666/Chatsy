import 'package:chatsy/components/inputfield.dart';
import 'package:chatsy/components/signup_inputfield.dart';
import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/Login/login.dart';
import 'package:chatsy/screens/auth/signup/components/background.dart';
import 'package:chatsy/screens/auth/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignupBackground(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Sign up Now!",
                style: GoogleFonts.blackHanSans(
                  fontStyle: FontStyle.normal,
                  color: textBlack,
                  fontSize: 22,
                ),
              ),
            ),
            SignupInputfield(hintText: "Email", icon: Icons.mail_outline),
            SignupInputfield(
                hintText: "Username",
                icon: Icons.supervised_user_circle_outlined),
            SignupInputfield(
                hintText: "Phone", icon: Icons.phone_android_outlined),
            SignupInputfield(hintText: "Password", icon: Icons.lock_outline),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.blackHanSans(
                      fontStyle: FontStyle.normal,
                      color: textBlack,
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
                      " Login",
                      style: GoogleFonts.blackHanSans(
                        fontStyle: FontStyle.normal,
                        color: primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
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
                    "Signup",
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
