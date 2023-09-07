import 'package:flutter/material.dart';

import 'color_pallete.dart';

class AppTextStyle {
  static const TextStyle splashTitleStyle = TextStyle(
      fontSize: 25,
      color: Color(0xff006D94),
      fontWeight: FontWeight.w600,
      fontFamily: "Cairo");
  static const TextStyle titleStyle = TextStyle(
      fontSize: 16,
      color: Color(0xff006D94),
      fontWeight: FontWeight.w600,
      fontFamily: "Cairo");

  static const TextStyle lightTitle = TextStyle(
    fontSize: 12,
    color: Color.fromARGB(255, 146, 145, 145),
  );

  static const TextStyle boldBlackTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "Cairo",
    fontSize: 16,
    color: Colors.black,
  );

  static const TextStyle bigLightTitle = TextStyle(
    fontFamily: "Cairo",
    fontSize: 14,
    color: Colors.grey,
  );
  static const TextStyle greenLabelText = TextStyle(
    fontSize: 12,
    color: Color(0xff249862),
  );
  static const TextStyle bigGreenLabelText = TextStyle(
    fontSize: 14,
    color: Color(0xff249862),
  );
  static const TextStyle tabsText = TextStyle(
      fontSize: 16,
      color: AppColorPallete.darkBlue,
      fontWeight: FontWeight.w400,
      fontFamily: "Cairo");

  static const TextStyle blackText = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle whiteText = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
}
