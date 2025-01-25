

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/utils/validation_utility.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactcontroller extends GetxController {
  static Contactcontroller get to => Get.put(Contactcontroller());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  RxBool isMessageFocused = false.obs;

  final FocusNode subjectfocusNode = FocusNode();
  final FocusNode messagefocusNode = FocusNode();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    subjectfocusNode.dispose();
    messagefocusNode.dispose();
    super.dispose();
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

  // Future<void> sendMail()async{
  //   print('Name: ${nameController.text}');
  //   print('Email: ${emailController.text}');
  //   print('Message: ${messageController.text}');
  // }

final subjectText = 'Please write your Subject'.obs;
// final bodyText = nameController.text.isNotEmpty ? nameController.text : 'Hi This is you'.obs;
final recipient = 'marimuthu.k.it@gmail.com'.obs;

/// Function to send email
Future<void> sendAndroidOrIosMail() async {
  final email = Email(
    body: nameController.text.isNotEmpty ? nameController.text : 'Hi This is you',
    subject: subjectText.value,
    recipients: [recipient.value],
    isHTML: false,
  );

  try {
    await FlutterEmailSender.send(email);
    Get.snackbar('Success', 'Email sent successfully!');
    print('succc mail');
  } catch (error) {
    // Get.snackbar('Error', 'Failed to send email: $error');
    // print('fail mail : $error');
    if (error is PlatformException && error.code == 'not_available') {
      // Get.snackbar('Error', 'No email client is installed. Please install an email app.');
      print('fail mail1 : $error');
    } else {
      // Get.snackbar('Error', 'Failed to send email: $error');
      print('fail mail2 : $error');
    }
  }
}


  Future<void> sendMail() async {

  if(1==1){

    if (kIsWeb) {

      // final String deepLink ='http://globetextiles.net/';
      // final Uri deepLinkUri = Uri.parse(deepLink);

      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: recipient.value,
        query: 'subject=${Uri.encodeComponent(subjectText.value)}&body=${Uri.encodeComponent(nameController.text.isNotEmpty ? nameController.text : 'Hi This is you')}',
      );

      final Uri gmailUri = Uri(
        scheme: 'https',
        host: 'mail.google.com',
        path: '/mail/',
        queryParameters: {
          'view': 'cm',
          'fs': '1',
          'to': recipient.value,
          'su': subjectText.value,
          'body': nameController.text.isNotEmpty ? nameController.text : 'Hi This is you',
        },
      );

      if (await canLaunchUrl(gmailUri)) {
        // await launchUrl(emailUri);
        await launchUrl(gmailUri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $gmailUri';
      }
    }
    else {
      sendAndroidOrIosMail();
      // final Email emailToSend = Email(
      //   body: bodyText.value,
      //   subject: subjectText.value,
      //   recipients: [recipient.value],
      //   isHTML: false,
      // );
      //
      // await FlutterEmailSender.send(emailToSend);
    }

  }else{

  }




  }


}