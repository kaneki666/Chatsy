import 'package:chatsy/components/button_primary.dart';
import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/auth/Login/login.dart';
import 'package:chatsy/screens/auth/signup/signup.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 4500),
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
        0.14285714285,
        curve: Curves.ease,
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
        0.14285714286,
        0.2857142857,
        curve: Curves.ease,
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
        0.2857142858,
        0.42857142855,
        curve: Curves.ease,
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
        0.42857142856,
        0.5714285714,
        curve: Curves.ease,
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
        0.5714285715,
        0.71428571425,
        curve: Curves.ease,
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
        0.71428571426,
        0.8571428571,
        curve: Curves.ease,
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
        0.8571428572,
        1,
        curve: Curves.ease,
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
    _startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
        child: AnimatedWidgetSplash(
            controller: _controller,
            animation: _animation,
            titlePosition: titlePosition,
            opacity: opacity,
            subtitlePosition: subtitlePosition,
            opacitySubtitle: opacitySubtitle,
            size: size,
            scaleButton: scaleButton,
            opacityBottom: opacityBottom),
      ),
    );
  }
}

class AnimatedWidgetSplash extends StatelessWidget {
  const AnimatedWidgetSplash({
    Key? key,
    required AnimationController controller,
    required Animation<double> animation,
    required this.titlePosition,
    required this.opacity,
    required this.subtitlePosition,
    required this.opacitySubtitle,
    required this.size,
    required this.scaleButton,
    required this.opacityBottom,
  })  : _controller = controller,
        _animation = animation,
        super(key: key);

  final AnimationController _controller;
  final Animation<double> _animation;
  final Animation<double> titlePosition;
  final Animation<double> opacity;
  final Animation<double> subtitlePosition;
  final Animation<double> opacitySubtitle;
  final Size size;
  final Animation<double> scaleButton;
  final Animation<double> opacityBottom;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 40,
              child: Hero(
                tag: 'tag-image-image',
                child: ScaleTransition(
                  scale: _animation,
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
              child: AnimatedOpacity(
                duration: Duration(microseconds: 100),
                opacity: opacity.value,
                child: Text(
                  "Hi, I'm Chatsy",
                  style: TextStyle(
                    color: textWhite,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            Positioned(
              top: subtitlePosition.value,
              child: AnimatedOpacity(
                duration: Duration(microseconds: 100),
                opacity: opacitySubtitle.value,
                child: Text(
                  "Your New Chat App",
                  style: TextStyle(
                    color: textWhite.withOpacity(0.6),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.8,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: ScaleTransition(
                  scale: scaleButton,
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
                child: AnimatedOpacity(
                  duration: Duration(microseconds: 100),
                  opacity: opacityBottom.value,
                  child: Text(
                    "I ALREADY HAVE AN ACCOUNNT",
                    style: TextStyle(
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
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 1500),
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
