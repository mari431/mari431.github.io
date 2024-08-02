

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/utils/validation_utility.dart';

class Contactcontroller extends GetxController {
  static Contactcontroller get to => Get.put(Contactcontroller());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    }
    // Add more complex validation logic here if needed
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!EmailValidator.isValidEmail(value)) {
    return 'Invalid email format';
    }
    // Add more complex validation logic here if needed
    return null;
  }


  String? validateMessage(String value) {
    if (value.isEmpty) {
      return 'Message is required';
    }
    // Add more complex validation logic here if needed
    return null;
  }

  Future<void> sendMail()async{
    print('Name: ${nameController.text}');
    print('Email: ${emailController.text}');
    print('Message: ${messageController.text}');
  }



}