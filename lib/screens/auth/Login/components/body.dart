import 'package:chatsy/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: primary,
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              height: size.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/logo.png',
                    height: 150,
                    width: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Chatsy",
                      style: GoogleFonts.blackHanSans(
                        fontStyle: FontStyle.normal,
                        color: textWhite,
                        fontSize: 50,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.6,
              width: size.width,
              decoration: BoxDecoration(
                color: textWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "Welcome to Chatsy!",
                      style: GoogleFonts.blackHanSans(
                        fontStyle: FontStyle.normal,
                        color: textBlack,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      height: 60,
                      width: size.width > 500 ? 300 : size.width - 100,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Icon(
                                Icons.mail_outline,
                                size: 25,
                                color: primaryLight,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Email or Username'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 20),
                    child: Container(
                      height: 60,
                      width: size.width > 500 ? 300 : size.width - 100,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Icon(
                                Icons.lock_outline,
                                size: 25,
                                color: primaryLight,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Password'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Text(
                      "I don't remember password!",
                      style: GoogleFonts.blackHanSans(
                        fontStyle: FontStyle.normal,
                        color: primary,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account!",
                        style: GoogleFonts.blackHanSans(
                          fontStyle: FontStyle.normal,
                          color: textBlack,
                          fontSize: 16,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Signup',
                            style: GoogleFonts.blackHanSans(
                              fontStyle: FontStyle.normal,
                              color: primary,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
