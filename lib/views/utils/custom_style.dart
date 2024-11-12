import 'package:flutter/material.dart';
import 'custom_color.dart';
import 'dimensions.dart';

class CustomStyle {
//------------------------dark--------------------------------
  static var darkHeading1TextStyle = TextStyle(
    color: CustomColor.primaryLightColor,
    fontSize: Dimensions.headingTextSize1,
    fontWeight: FontWeight.w700,
  );
  static var darkHeading2TextStyle = TextStyle(
    color: CustomColor.primaryDarkTextColor,
    fontSize: Dimensions.headingTextSize2,
    fontWeight: FontWeight.w700,
  );
  static var darkHeading3TextStyle = TextStyle(
    color: CustomColor.primaryDarkTextColor,
    fontSize: Dimensions.headingTextSize3,
    fontWeight: FontWeight.w700,
  );
  static var darkHeading4TextStyle = TextStyle(
    color: CustomColor.primaryDarkTextColor,
    fontSize: Dimensions.headingTextSize4,
    fontWeight: FontWeight.w400,
  );
  static var darkHeading5TextStyle = TextStyle(
    color: CustomColor.primaryDarkTextColor,
    fontSize: Dimensions.headingTextSize5,
    fontWeight: FontWeight.w400,
  );

//------------------------light--------------------------------
  static var lightHeading1TextStyle = TextStyle(
    color: CustomColor.primaryDarkTextColor,
    fontSize: Dimensions.headingTextSize1,
    fontWeight: FontWeight.w700,
  );
  static var lightHeading2TextStyle = TextStyle(
    color: CustomColor.primaryDarkTextColor,
    fontSize: Dimensions.headingTextSize2,
    fontWeight: FontWeight.w700,
  );
  static var lightHeading3TextStyle = TextStyle(
    color: CustomColor.primaryDarkTextColor,
    fontSize: Dimensions.headingTextSize3,
    fontWeight: FontWeight.w700,
  );
  static var lightHeading4TextStyle = TextStyle(
    color: CustomColor.primaryDarkTextColor,
    fontSize: Dimensions.headingTextSize4,
    fontWeight: FontWeight.w400,
    // fontFamily: GoogleFonts.josefinSans().fontFamily,
  );
  static var lightHeading5TextStyle = TextStyle(
    color: CustomColor.primaryDarkTextColor,
    fontSize: Dimensions.headingTextSize5,
    fontWeight: FontWeight.w400,
    // fontFamily: GoogleFonts.josefinSans().fontFamily,
  );

  static var screenGradientBG2 = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
        CustomColor.primaryDarkColor,
        CustomColor.primaryBGDarkColor,
      ]));

  static var whiteTextStyle = TextStyle(
    color: CustomColor.whiteColor,
    fontSize: Dimensions.headingTextSize3,
    fontWeight: FontWeight.w500,
    // fontFamily: GoogleFonts.josefinSans().fontFamily,
  );

  static var statusTextStyle = TextStyle(
    fontSize: Dimensions.headingTextSize6,
    fontWeight: FontWeight.w600,
    // fontFamily: GoogleFonts.josefinSans().fontFamily,
  );

  static var yellowTextStyle = TextStyle(
    color: CustomColor.orangeColor,
    fontSize: Dimensions.headingTextSize6,
    fontWeight: FontWeight.w600,
    // fontFamily: GoogleFonts.josefinSans().fontFamily,
  );
}
