import 'package:chatsy/constants/constants.dart';
import 'package:chatsy/screens/home/chats/index.dart';
import 'package:chatsy/screens/home/home_screen/componnets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = [
    HomeScreenBody(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Chats(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<IconData> data = [
    Icons.home_outlined,
    Icons.search,
    Icons.add_box_outlined,
    Icons.chat_bubble_outline_rounded,
    Icons.person_outline_sharp
  ];
  List<IconData> dataa = [
    Icons.home,
    Icons.search,
    Icons.add_box_outlined,
    Icons.chat_bubble_rounded,
    Icons.person
  ];
  ScrollController _scroller = ScrollController();
  late AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late AnimationController _controller2 = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late Animation<double> translateY = Tween<double>(
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

  late Animation<double> scale = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(
    CurvedAnimation(
      parent: _controller2,
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
    } on TickerCanceled {}
  }

  Future _startAnimationScale() async {
    try {
      await _controller2.forward().orCancel;
    } on TickerCanceled {}
  }

  Future _startAnimationN() async {
    try {
      await _controller.reverse().orCancel;
    } on TickerCanceled {}
  }

  num height1 = 0.87;

  @override
  dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool upDirection = true, flag = true;
  @override
  void initState() {
    super.initState();

    _scroller
      ..addListener(() {
        upDirection =
            _scroller.position.userScrollDirection == ScrollDirection.forward;

        // makes sure we don't call setState too much, but only when it is needed
        if (upDirection != flag) setState(() {});

        flag = upDirection;
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double tabPadding = 10;
    double tabItemWidth = (size.width - 20) / 5 - tabPadding;
    print("$tabItemWidth, $tabPadding");
    if (upDirection == false) {
      setState(() {
        height1 = 1;
      });
      _startAnimation();
    } else {
      setState(() {
        height1 = 0.87;
      });
      _startAnimationN();
      _controller2.reverse();
    }
    return Scaffold(
      backgroundColor: bgHome2,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              height: size.height * height1,
              width: MediaQuery.of(context).size.width,
              child: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    controller: _scroller,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: _widgetOptions.elementAt(_selectedIndex),
                    ),
                  );
                },
              ),
            ),
          ),
          buildPositioned(context, tabPadding, tabItemWidth),
          buildItemCenter(),
          Positioned(
            bottom: 15,
            child: AnimatedBuilder(
              animation: _controller2,
              builder: (context, child) {
                return Transform.scale(
                  scale: scale.value,
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          stops: [0.0, 0.6, 0.9],
                          begin: FractionalOffset.centerLeft,
                          end: FractionalOffset.bottomRight,
                          tileMode: TileMode.clamp,
                          colors: [
                            modalTop,
                            modalMid,
                            modalBottom
                          ], // red to yellow
                          // repeats the gradient over the canvas
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 35,
                        color: textWhite,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildItemCenter() {
    return Positioned(
      bottom: 15,
      child: GestureDetector(
        onTap: () {
          print("tapped");
          _startAnimationScale();
        },
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              gradient: LinearGradient(
                stops: [0.0, 0.6, 0.9],
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.bottomRight,
                tileMode: TileMode.clamp,
                colors: [modalTop, modalMid, modalBottom], // red to yellow
                // repeats the gradient over the canvas
              ),
            ),
            child: Icon(
              Icons.add,
              size: 35,
              color: textWhite,
            ),
          ),
        ),
      ),
    );
  }

  Positioned buildPositioned(
      BuildContext context, double tabPadding, double tabItemWidth) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: translateY.value,
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      child: Container(
                        height: 70,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: data.length,
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (ctx, i) => Padding(
                            padding: EdgeInsets.only(
                              left: tabPadding,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = i;
                                });
                              },
                              child: i == 2
                                  ? SizedBox(
                                      width: tabItemWidth,
                                    )
                                  : AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      width: tabItemWidth,
                                      // decoration: BoxDecoration(
                                      //   border: i == _selectedIndex
                                      //       ? Border(
                                      //           top: BorderSide(
                                      //             width: 3.0,
                                      //             color: textDark,
                                      //           ),
                                      //         )
                                      //       : null,
                                      // ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            i == _selectedIndex
                                                ? dataa[i]
                                                : data[i],
                                            size: 25,
                                            color: i == _selectedIndex
                                                ? bgLight
                                                : Colors.grey.shade800,
                                          ),
                                          i == _selectedIndex
                                              ? Container(
                                                  height: 5,
                                                  width: 5,
                                                  decoration: BoxDecoration(
                                                    color: textDark,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5 / 2),
                                                  ),
                                                )
                                              : SizedBox(
                                                  height: 1,
                                                  width: 1,
                                                )
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
