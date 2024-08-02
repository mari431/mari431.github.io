import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';

import 'dart:js' as js;

import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/controllers/contactController.dart';
import 'package:marimuthu_portfolio/widgets/custom_widget/custom_textfield.dart';

class ContactScreen extends StatelessWidget {
   ContactScreen({super.key});

  final ThemeController _themeFindController = Get.find<ThemeController>();
   final _contactformKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      // color: Colors.grey.shade200,
      child: Form(
        key: _contactformKey,
        child: Column(
          children: [

            const SizedBox(height: 50),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
                maxHeight: 100,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth >= kMinDesktopWidth) {
                    return buildNameEmailFieldDesktop();
                  }

                  // else
                  return buildNameEmailFieldMobile();
                },
              ),
            ),
            const SizedBox(height: 15),
            // message
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              child: CustomTextField(
                controller: Contactcontroller.to.messageController,
                hintText: "Your message",
                maxLines: 8,
                validator:(val){
                  Contactcontroller.to.validateMessage(val!);
                }
              ),
            ),

            const SizedBox(height: 15),

            ConstrainedBox(
              constraints:  BoxConstraints(
                maxWidth: 700,
              ),
              child:  SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.SendBtnTextColor(_themeFindController.isDarkMode.value),
                    backgroundColor: AppColors.SendBtnBgColor(_themeFindController.isDarkMode.value), // Text color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Border radius
                    ),
                    elevation: 5, // Shadow elevation
                  ),
                  onPressed: () {
                    if (_contactformKey.currentState!.validate()) {
                      // Handle form submission here
                      Contactcontroller.to.sendMail();
                    }

                  },
                  child: Text("Under Processing..."),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        // name
        Flexible(
          child: CustomTextField(
            controller: Contactcontroller.to.nameController,
            hintText: "Your name",
              validator:(val){
                Contactcontroller.to.validateName(val!);
              }

          ),
        ),
        const SizedBox(width: 15),
        // email
        Flexible(
          child: CustomTextField(
            controller: Contactcontroller.to.emailController,
            hintText: "Your email",
              validator:(val){
                Contactcontroller.to.validateEmail(val!);
              }
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        // name
        Flexible(
          child: CustomTextField(
            controller: Contactcontroller.to.nameController,
            hintText: "Your name",
              validator:(val){
                Contactcontroller.to.validateName(val!);
              }
          ),
        ),
        const SizedBox(height: 15),
        // email
        Flexible(
          child: CustomTextField(
            controller: Contactcontroller.to.emailController,
            hintText: "Your email",
              validator:(val){
                Contactcontroller.to.validateEmail(val!);
              }
          ),
        ),
      ],
    );
  }
}