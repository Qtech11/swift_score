import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

TextStyle kTextStyle1(height) => GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: height / 43, color: kTextColors));

TextStyle kTextStyle2(height) => GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: height / 38,
        color: Colors.white,
        fontWeight: FontWeight.w500));

TextStyle kTextStyle3(height) => GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: height / 65,
      color: kBaseSelectedIconColors,
    ));

TextStyle kTextStyle4(height) => GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: height / 55,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ));

TextStyle kTextStyle5(height) => GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: height / 60,
      color: kTextColors,
    ));

TextStyle kTextStyle6(height) => GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: height / 57,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ));

TextStyle kTextStyle7(height) => GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: height / 55,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ));
