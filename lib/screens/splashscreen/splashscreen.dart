import 'package:chatsy/components/button_primary.dart';
import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/Login/login.dart';
import 'package:chatsy/screens/auth/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 3500),
    vsync: this,
  );

  late Animation<double> _animation = Tween<double>(
    begin: 0.0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.easeIn,
      ),
    ),
  );

  late Animation<double> opacity = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.2,
        0.34,
        curve: Curves.decelerate,
      ),
    ),
  );

  late Animation<double> titlePosition = Tween<double>(
    begin: 210.0,
    end: 190.0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.30,
        0.48,
        curve: Curves.fastOutSlowIn,
      ),
    ),
  );

  late Animation<double> opacitySubtitle = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.48,
        0.62,
        curve: Curves.easeIn,
      ),
    ),
  );

  late Animation<double> subtitlePosition = Tween<double>(
    begin: 280.0,
    end: 260.0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.58,
        0.72,
        curve: Curves.easeInCubic,
      ),
    ),
  );

  late Animation<double> scaleButton = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.72,
        0.88,
        curve: Curves.bounceIn,
      ),
    ),
  );

  late Animation<double> opacityBottom = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.88,
        1,
        curve: Curves.easeIn,
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
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
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
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 40,
                  child: ScaleTransition(
                    scale: _animation,
                    child: Hero(
                      tag: 'tag-image-image',
                      child: Image.asset(
                        "assets/icons/logo.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: titlePosition.value,
                  child: Opacity(
                    opacity: opacity.value,
                    child: Text(
                      "Hi, I'm Chatsy",
                      style: GoogleFonts.blackHanSans(
                        color: textWhite,
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: subtitlePosition.value,
                  child: Opacity(
                    opacity: opacitySubtitle.value,
                    child: Text(
                      "Your New Chat App",
                      style: GoogleFonts.blackHanSans(
                        color: textWhite.withOpacity(0.6),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.8,
                  child: ScaleTransition(
                    scale: scaleButton,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: ButtonPrimary(
                        size: size,
                        text: "SIGN UP",
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.92,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(_createRoute());
                    },
                    child: Opacity(
                      opacity: opacityBottom.value,
                      child: Text(
                        "I ALREADY HAVE AN ACCOUNNT",
                        style: GoogleFonts.blackHanSans(
                          color: textWhite.withOpacity(0.6),
                          fontSize: size.width * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => Login(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(
        curve: curve,
      ));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
