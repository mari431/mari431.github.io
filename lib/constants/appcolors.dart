import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF00796B);
  static const Color secondaryColor = Color(0xFF64FFDA);
  static const Color accentColor = Color(0xFFFF5722);
  // static const Color textBlackColor = Color(0xFF333333);
  static const Color textBlackColor = Colors.black;
  static const Color textWhiteColor = Colors.white;
  static const Color backgroundColor = Color(0xFFF5F5F5);

  static const Color positionColor = Colors.lightGreenAccent;

  static Color navBarTitleTextColor(bool isDarkMode) {
    return isDarkMode ?  Colors.lightGreenAccent : Colors.black;
  }

  static Color navBarBgColor(bool isDarkMode) {
    return isDarkMode ? const Color(0x3B3B5B5B) : Colors.green;
  }

}