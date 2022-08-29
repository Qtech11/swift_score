import 'package:flutter/material.dart';
import 'colors.dart';

TextStyle kTextStyle1(width) =>
    TextStyle(fontSize: width / 25, color: kTextColors);

TextStyle kTextStyle2(width) => TextStyle(
    fontSize: width / 22, color: Colors.white, fontWeight: FontWeight.w600);

TextStyle kTextStyle3(width) =>
    TextStyle(fontSize: width / 35, color: kBaseSelectedIconColors);

TextStyle kTextStyle4(width) => TextStyle(
    fontSize: width / 30, color: Colors.white, fontWeight: FontWeight.w600);

TextStyle kTextStyle5(width) =>
    TextStyle(fontSize: width / 35, color: kTextColors);
