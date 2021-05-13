import 'package:chatsy/components/signup_inputfield.dart';
import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/Login/login.dart';
import 'package:chatsy/screens/auth/otp/otp.dart';
import 'package:chatsy/screens/auth/signup/components/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql/client.dart';

class SignupBody extends StatefulWidget {
  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const String addStar = """
      mutation registerUser(\$username: String!, \$phone: String!, \$password: String!) {
        register(registerInput: {
          username: \$username,
          phone: \$phone,
          password: \$password,
        }){
          phone
          message         
        }
      }
    """;

    final _httpLink = HttpLink(
      'http://localhost:4000/graphql',
    );

    final GraphQLClient client = GraphQLClient(
      /// **NOTE** The default store is the InMemortyStore, which does NOT persist to disk
      cache: GraphQLCache(),
      link: _httpLink,
    );

    void onSignUp() async {
      final MutationOptions options = MutationOptions(
        document: gql(addStar),
        variables: <String, dynamic>{
          "username": usernameController.text,
          "password": passwordController.text,
          "phone": phoneController.text
        },
      );

      // final QueryResult result = await client.mutate(options);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Otp(
              phoneNumber: phoneController.text,
            );
          },
        ),
      );
      // if (result.hasException) {
      //   print(result.exception.toString());
      //   return;
      // }
    }

    return SignupBackground(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.4,
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
            SignupInputfield(
                hintText: "Username",
                controller: usernameController,
                icon: Icons.supervised_user_circle_outlined),
            SignupInputfield(
                hintText: "Phone",
                controller: phoneController,
                icon: Icons.phone_android_outlined),
            SignupInputfield(
                hintText: "Password",
                controller: passwordController,
                icon: Icons.lock_outline),
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
              onTap: () {
                onSignUp();
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
