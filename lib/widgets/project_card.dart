import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';


import 'dart:js' as js;

import 'package:marimuthu_portfolio/utils/project_utils.dart';

class ProjectCardWidget extends StatelessWidget {
   ProjectCardWidget({
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  final ThemeController _themeFindController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 290,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Color(0xff424657),
          color:AppColors.wProjectBgColor(_themeFindController.isDarkMode.value),
          // color: Colors.lightGreenAccent.withOpacity(0.5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0)
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // project img
          Image.asset(
            project.image,
            height: 140,
            width: 280,
            fit: BoxFit.fill,
            // color: Colors.black,
          ),
          // title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                // color: CustomColor.whitePrimary,
              ),
            ),
          ),
          // subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                fontSize: 12,
                // color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          const Spacer(),
          // footer
          Container(
            // color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "Available on:",
                  style: TextStyle(
                    // color: Colors.greenAccent,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                if (project.iosLink != null)
                  InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.iosLink]);
                    },
                    child: Image.asset(
                      "images/ios_icon.png",
                      width: 15,
                      color: AppColors.wProjectIosIconColor(_themeFindController.isDarkMode.value),
                    ),
                  ),
                if (project.androidLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.androidLink]);
                      },
                      child: Image.asset(
                        "images/android_icon.png",
                        width: 15,
                        color: AppColors.wProjectAndroidIconColor(_themeFindController.isDarkMode.value),
                      ),
                    ),
                  ),
                if (project.webLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () {
                        js.context.callMethod("open", [project.webLink]);
                      },
                      child: Image.asset(
                        "images/web_icon.png",
                        width: 15,
                        color: AppColors.wProjectWebIconColor(_themeFindController.isDarkMode.value),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}