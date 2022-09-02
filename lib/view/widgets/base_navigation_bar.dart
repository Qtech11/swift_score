import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_score/view/utilities/colors.dart';
import 'package:swift_score/view/screens/home_screen.dart';

import '../screens/fixtures_screen.dart';

class BaseNavigationBar extends StatefulWidget {
  const BaseNavigationBar({Key? key}) : super(key: key);

  @override
  State<BaseNavigationBar> createState() => _BaseNavigationBarState();
}

class _BaseNavigationBarState extends State<BaseNavigationBar> {
  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const FixturesScreen(),
    const Center(
      child: Text('standings'),
    ),
    const Center(
      child: Text('news'),
    ),
    const Center(
      child: Text('account'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff333333),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBottomNavigationBarColor,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chart_bar_square),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: '.',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(color: kBaseSelectedIconColors),
        selectedItemColor: kBaseSelectedIconColors,
        unselectedItemColor: kBaseIconColors,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
