import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift_score/view/utilities/colors.dart';
import 'package:swift_score/view/screens/home_screen.dart';
import 'package:swift_score/view/utilities/styles.dart';

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
        iconSize: height / 30,
        backgroundColor: kBottomNavigationBarColor,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Fixtures',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Account',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: kTextStyle3(height),
        selectedItemColor: kBaseSelectedIconColors,
        unselectedItemColor: kBaseIconColors,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
    );
  }
}
