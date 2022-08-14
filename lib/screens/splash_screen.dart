import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation1;
  double _textOpacity = 0;
  double _containerOpacity = 0;
  double _fontSize = 2;
  double _containerSize = 1.5;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation1 = Tween<double>(
      begin: 40,
      end: 20,
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          _textOpacity = 1;
        });
      });

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 3), () {
      setState(() {
        _containerOpacity = 1;
        _containerSize = 2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff222222),
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                height: height / _fontSize,
                curve: Curves.fastLinearToSlowEaseIn,
              ),
              AnimatedOpacity(
                opacity: _textOpacity,
                duration: const Duration(seconds: 1),
                child: Text(
                  'SWIFT SCORE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: animation1.value,
                  ),
                ),
              )
            ],
          ),
          Center(
            child: AnimatedOpacity(
              opacity: _containerOpacity,
              duration: const Duration(seconds: 2),
              curve: Curves.fastLinearToSlowEaseIn,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.fastLinearToSlowEaseIn,
                // decoration: const BoxDecoration(
                //   color: Colors.teal,
                //   borderRadius: BorderRadius.all(Radius.circular(25)),
                // ),
                height: width / _containerSize,
                width: width / _containerSize,
                child: Image.asset(
                  'images/splash1.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
