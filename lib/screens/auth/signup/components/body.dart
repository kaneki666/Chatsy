import 'package:chatsy/components/button_primary.dart';
import 'package:chatsy/components/inputfield.dart';
import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/Login/login.dart';
import 'package:chatsy/screens/auth/otp/otp.dart';
import 'package:chatsy/screens/auth/signup/components/background.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SignupBody extends StatefulWidget {
  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody>
    with SingleTickerProviderStateMixin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  KeyboardVisibilityController keyboardVisibilityController =
      KeyboardVisibilityController();

  late AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );

  late Animation<double> opacity = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.0,
        1.0,
        curve: Curves.easeOut,
      ),
    ),
  );

  Future _startAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible == true) {
        _startAnimation();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late Animation<double> translateY = Tween<double>(
      begin: 0,
      end: -size.height * 0.25,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeOutExpo,
        ),
      ),
    );
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
      controller: _controller,
      opacity: opacity,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, translateY.value),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputField(
                    hintText: "Username",
                    // controller: usernameController,
                    icon: Icons.person_outline),
                InputField(
                    hintText: "Fullname",
                    // controller: usernameController,
                    icon: Icons.supervised_user_circle_outlined),
                InputField(
                    hintText: "Phone",
                    // controller: phoneController,
                    icon: Icons.phone_android_outlined),
                InputField(
                    hintText: "Password",
                    // controller: passwordController,
                    icon: Icons.lock_outline),
              ],
            ),
          );
        },
      ),
      child2: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
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
                  " Login",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: textWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              onSignUp();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: ButtonPrimary(
                size: size,
                text: "SIGN UP",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
