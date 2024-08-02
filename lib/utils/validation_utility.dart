import 'dart:core';

class EmailValidator {
  static final RegExp _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }
}