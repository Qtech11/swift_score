import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

TextStyle kTextStyle1(width) => GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: width / 25, color: kTextColors));

TextStyle kTextStyle2(width) => GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: width / 22,
        color: Colors.white,
        fontWeight: FontWeight.w600));

TextStyle kTextStyle3(width) => GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: width / 40,
      color: kBaseSelectedIconColors,
    ));

TextStyle kTextStyle4(width) => GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: width / 33,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ));

TextStyle kTextStyle5(width) => GoogleFonts.poppins(
        textStyle: TextStyle(
      fontSize: width / 37,
      color: kTextColors,
    ));
