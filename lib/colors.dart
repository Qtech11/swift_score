import 'dart:math';

import 'package:flutter/material.dart';

const kBaseIconColors = Color(0xffc3c2c4);
const kBaseSelectedIconColors = Color(0xffFB5756);
const kBottomNavigationBarColor = Color(0xff131313);
const kTextColors = Color(0xff9A9A9A);

Color randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

TextStyle kTextStyle1(width) =>
    TextStyle(fontSize: width / 25, color: kTextColors);

TextStyle kTextStyle2(width) => TextStyle(
    fontSize: width / 22, color: Colors.white, fontWeight: FontWeight.w600);

List<String> color = [
  'blue',
  'orange',
  'teal',
  'black54',
];
