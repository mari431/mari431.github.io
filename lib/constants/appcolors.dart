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

  static Color homeBgColor(bool isDarkMode) {
    return isDarkMode ? Colors.black45 : Colors.white38;
  }

  static Color homeTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.black;
  }

  static Color aboutBgColor(bool isDarkMode) {
    return isDarkMode ? Colors.black12 : Colors.white38;
  }


  static Color skillTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.black;
  }

  static Color skillBgColor(bool isDarkMode) {
    return isDarkMode ? Colors.black45 : Colors.white38;
  }

  static Color skillIconColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.black;
  }

  static Color wProjectBgColor(bool isDarkMode) {
    return isDarkMode ? Colors.black12 : Colors.white38;
  }

  static Color wProjectAndroidIconColor(bool isDarkMode) {
    return isDarkMode ? Colors.green : Colors.green;
  }
  static Color wProjectIosIconColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.white;
  }
  static Color wProjectWebIconColor(bool isDarkMode) {
    return isDarkMode ? Colors.blueAccent : Colors.blueAccent;
  }

  static Color GetInTouchBGColor(bool isDarkMode) {
    return isDarkMode ? Colors.black54 : Colors.white38;
  }

  static Color GetInTouchIconColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.black;
  }

  static Color GetInTouchTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.white : Colors.black;
  }

  static Color SendBtnTextColor(bool isDarkMode) {
    return isDarkMode ? Colors.black : Colors.white;
  }

  static Color SendBtnBgColor(bool isDarkMode) {
    return isDarkMode ? Colors.lightGreenAccent : Colors.black;
  }

}