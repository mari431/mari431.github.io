import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';

import 'dart:js' as js;

import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/controllers/contactController.dart';
import 'package:marimuthu_portfolio/widgets/custom_widget/custom_textfield.dart';

import '../constants/appfonts.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  final ThemeController _themeFindController = Get.find<ThemeController>();
  final _contactformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Form(
        key: _contactformKey,
        child: Column(
          children: [
            const Text(
              "Contact me",
              style: TextStyle(
                fontSize: AppFonts.subHeader,
                fontWeight: FontWeight.bold,
                // color: CustomColor.whitePrimary,
              ),
            ),
            const Text(
              "Do you have a project or an idea? Feel free to contact me.",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: Contactcontroller.to.nameController,
              focusNode: Contactcontroller.to.subjectfocusNode,
              decoration: InputDecoration(
                hintText: 'Write your message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 700,
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.SendBtnTextColor(
                        _themeFindController.isDarkMode.value),
                    backgroundColor: AppColors.SendBtnBgColor(
                        _themeFindController.isDarkMode.value),
                    // Text color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Border radius
                    ),
                    elevation: 5, // Shadow elevation
                  ),
                  onPressed: () {
                    Contactcontroller.to.sendMail();
                  },
                  child: Text("Send Mail"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
