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
        // color: Colors.grey.shade200,
        // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Form(
          key: _contactformKey,
          child: Column(
            children: [
              const Text(
                "Contact",
                style: TextStyle(
                  fontSize: AppFonts.aboutFDesk,
                  fontWeight: FontWeight.bold,
                  // color: CustomColor.whitePrimary,
                ),
              ),

              const SizedBox(height: 50),

              TextFormField(
                                controller: Contactcontroller.to.nameController,
                                // autofocus: false,
                                focusNode: Contactcontroller.to.subjectfocusNode,
                                // focusNode: FocusNode(),
                                decoration: InputDecoration(
                hintText: 'Write your message',
                // border: InputBorder.none,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                fillColor: Colors.white,
                // focusColor: Colors.white,
                // focusedBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.all(Radius.circular(12.0)))
                                ),
                              ),
              // ConstrainedBox(
              //   constraints: const BoxConstraints(
              //     maxWidth: 700,
              //     maxHeight: 100,
              //   ),
              //   child: LayoutBuilder(
              //     builder: (context, constraints) {
              //       if (constraints.maxWidth >= kMinDesktopWidth) {
              //         return buildNameEmailFieldDesktop();
              //       }
              //        else {
              //         return buildNameEmailFieldMobile();
              //       }
              //     },
              //   ),
              // ),
              const SizedBox(height: 15),
              // message
              // ConstrainedBox(
              //   constraints: const BoxConstraints(
              //     maxWidth: 700,
              //   ),
              //   child: TextFormField(
              //     controller: Contactcontroller.to.messageController,
              //     autofocus: false,
              //     focusNode: _messagefocusNode,
              //     // focusNode: FocusNode(),
              //     decoration: InputDecoration(
              //       hintText: 'Write your message',
              //       // border: InputBorder.none,
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12.0),
              //         borderSide: BorderSide(color: Colors.blue),
              //       ),
              //       contentPadding: EdgeInsets.symmetric(horizontal: 20),
              //       // fillColor: Colors.white,
              //       // focusColor: Colors.white,
              //       // focusedBorder: OutlineInputBorder(
              //       //     borderRadius: BorderRadius.all(Radius.circular(12.0)))
              //     ),
              //   ),
              //
              //   // TextFormField(
              //   //   controller: Contactcontroller.to.messageController,
              //   //     maxLines: 8,
              //   // ),
              //   // child: CustomTextField(
              //   //   controller: Contactcontroller.to.messageController,
              //   //   hintText: "Your message",
              //   //   maxLines: 8,
              //   //   // validator:(val){
              //   //   //   Contactcontroller.to.validateMessage(val!);
              //   //   // }
              //   // ),
              // ),

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
                      // if (_contactformKey.currentState!.validate()) {
                      //   // Handle form submission here
                      //   Contactcontroller.to.sendMail();
                      // }
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

   Column buildNameEmailFieldDesktop() {
    return Column(children:[
      const Text(
        "Contact",
        style: TextStyle(
          fontSize: AppFonts.aboutFDesk,
          fontWeight: FontWeight.bold,
          // color: CustomColor.whitePrimary,
        ),
      ),
      Row(
        children: [
          // name
          // Flexible(
          //   child: CustomTextField(
          //       controller: Contactcontroller.to.nameController,
          //     focusNode: subjectFocusNode,  // Passing focus node
          //       hintText: "Your name",
          //       // validator:(val){
          //       //   Contactcontroller.to.validateName(val!);
          //       // }
          //   ),
          // ),

          // Flexible(
          //     child: TextFormField(
          //   controller: Contactcontroller.to.nameController,
          //   autofocus: false,
          //   focusNode: _subjectfocusNode,
          //   // focusNode: FocusNode(),
          //   decoration: InputDecoration(
          //     hintText: 'Write your Subject',
          //     // border: InputBorder.none,
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12.0),
          //       borderSide: BorderSide(color: Colors.blue),
          //     ),
          //     contentPadding: EdgeInsets.symmetric(horizontal: 20),
          //     fillColor: Colors.white,
          //     focusColor: Colors.white,
          //     // focusedBorder: OutlineInputBorder(
          //     //     borderRadius: BorderRadius.all(Radius.circular(12.0)))
          //   ),
          // )),


          const SizedBox(width: 15),
          // email
          // Flexible(
          //   child: CustomTextField(
          //       controller: Contactcontroller.to.emailController,
          //       focusNode: messageFocusNode,
          //       hintText: "Your email",
          //       // validator:(val){
          //       //   Contactcontroller.to.validateEmail(val!);
          //       // }
          //   ),
          // ),

        ],
      )
    ]);
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Contact",
          style: TextStyle(
            fontSize: AppFonts.aboutFDesk,
            fontWeight: FontWeight.bold,
            // color: CustomColor.whitePrimary,
          ),
        ),
        // name
        // Flexible(
        //   child: CustomTextField(
        //     controller: Contactcontroller.to.nameController,
        //     focusNode:subjectFocusNode,
        //     hintText: "Your name",
        //       // validator:(val){
        //       //   Contactcontroller.to.validateName(val!);
        //       // }
        //   ),
        // ),
        const SizedBox(height: 15),
        // email
        // Flexible(
        //   child: CustomTextField(
        //     controller: Contactcontroller.to.emailController,
        //     hintText: "Your email",
        //       // validator:(val){
        //       //   Contactcontroller.to.validateEmail(val!);
        //       // }
        //   ),
        // ),
      ],
    );
  }


}