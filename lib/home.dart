import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    setupAnimation();
  }

  void setupAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween<double>(begin: 0, end: 5).animate(_controller);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              //height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.blueGrey[900],
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                        left: 60,
                        top: 26,
                        child: AnimatedBuilder(
                          animation: animation,
                          builder: (_, child) {
                            return Transform.rotate(
                              angle: _controller.value * 2 * math.pi,
                              child: child,
                            );
                          },
                          child: Image.asset(
                            'assets/images/fanblade.png',
                            height: 180,
                          ),
                        )

                        // Image.asset(
                        //   'assets/images/fanblade.png',
                        //   height: 180,
                        // ),
                        ),
                    Image.asset(
                      'assets/images/fanframe.png',
                      height: 300,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              //height: MediaQuery.of(context).size.height / 0.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.blueGrey[500],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'CONTROLS',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white54),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      width: 400,
                      color: Colors.blueGrey[900],
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  key: UniqueKey(),

                                  onPressed: () {
                                    _controller.repeat();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green, // background
                                    onPrimary: Colors.white, // foreground
                                  ),
                                  //color: Colors.grey[300],
                                  child: Text(
                                    'ON',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                  key: UniqueKey(),
                                  onPressed: () {
                                    _controller.stop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red, // background
                                    onPrimary: Colors.white, // foreground
                                  ),
                                  //color: Colors.grey[300],
                                  child: Text(
                                    'OFF',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'SPEED',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white54),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    _controller.repeat(
                                        period: Duration(milliseconds: 1500));
                                  },
                                  color: Colors.grey[300],
                                  shape: CircleBorder(),
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    "1",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    _controller.repeat(
                                        period: Duration(milliseconds: 1000));
                                  },
                                  color: Colors.grey[300],
                                  shape: CircleBorder(),
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    "2",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    _controller.repeat(
                                        period: Duration(milliseconds: 700));
                                  },
                                  color: Colors.grey[300],
                                  shape: CircleBorder(),
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    "3",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    _controller.repeat(
                                        period: Duration(milliseconds: 400));
                                  },
                                  color: Colors.grey[300],
                                  shape: CircleBorder(),
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    "4",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget button(Ticker speed) {
    return MaterialButton(
      onPressed: () {
        speed;
      },
      color: Colors.grey[300],
      shape: CircleBorder(),
      // ignore: prefer_const_constructors
      child: Text(
        "1",
        // ignore: prefer_const_constructors
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
