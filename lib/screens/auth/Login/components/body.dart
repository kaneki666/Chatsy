import 'package:chatsy/components/inputfield.dart';
import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/Login/components/background.dart';
import 'package:chatsy/screens/auth/forgot_password/forgot_passsword.dart';
import 'package:chatsy/screens/auth/signup/signup.dart';
import 'package:chatsy/screens/home/chats/chats.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: Text(
                "Welcome to Chatsy!",
                style: GoogleFonts.blackHanSans(
                  fontStyle: FontStyle.normal,
                  color: textBlack,
                  fontSize: 22,
                ),
              ),
            ),
            InputField(hintText: "Email or Username", icon: Icons.mail_outline),
            InputField(hintText: "Password", icon: Icons.lock_outline),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FogotPassword();
                    },
                  ),
                );
              },
              child: Text(
                "I don't remember password!",
                style: GoogleFonts.blackHanSans(
                  fontStyle: FontStyle.normal,
                  color: primary,
                  fontSize: 18,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Chats();
                  }),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 220,
                  decoration: BoxDecoration(
                    color: buttonBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Login",
                    style: GoogleFonts.merriweatherSans(
                      fontStyle: FontStyle.normal,
                      color: textWhite,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account!",
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
                              return Signup();
                            },
                          ),
                        );
                      },
                      child: Text(
                        " Signup",
                        style: GoogleFonts.blackHanSans(
                          fontStyle: FontStyle.normal,
                          color: primary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
