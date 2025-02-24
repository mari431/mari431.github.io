import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/controllers/UrlController.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';
import 'package:marimuthu_portfolio/widgets/custom_widget/HoverShadowWidget.dart';

import '../constants/skill_items.dart';

class GetInTouchWithMePage extends StatelessWidget {
  GetInTouchWithMePage({super.key});

  final ThemeController _themeFindController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
        // color: AppColors.skillBgColor(_themeFindController.isDarkMode.value),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                  maxHeight: 250,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth >= kMinDesktopWidth) {
                      return buildSkillDesktop();
                    }
                    // else
                    return buildSkillMobile();
                  },
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Column buildSkillDesktop() {
    return Column(
      children: [
        const Text(
          "Get in touch",
          style: TextStyle(
            fontSize: AppFonts.subHeader,
            fontWeight: FontWeight.bold,
            // color: CustomColor.whitePrimary,
          ),
        ),
        Row(
          children: [
            // skills
            Expanded(
              child: Container(
                width: Get.width,
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    for (int i = 0; i < getInTouchWithMeItems.length; i++)
                      HoverShadowContainer(
                        child: InkWell(
                          onTap: (){
                            UrlController.to.openUrl(getInTouchWithMeItems[i]["link"]);
                            // getInTouchWithMeItems[i]["title"]
                          },
                          child: Chip(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 16.0,
                            ),
                            backgroundColor: AppColors.GetInTouchBGColor(_themeFindController.isDarkMode.value),
                            label: Text(getInTouchWithMeItems[i]["title"],style: TextStyle(color: AppColors.GetInTouchTextColor(_themeFindController.isDarkMode.value)),),
                            avatar: Image.asset(getInTouchWithMeItems[i]["img"],color: AppColors.GetInTouchIconColor(_themeFindController.isDarkMode.value),),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Column buildSkillMobile() {
    return Column(
      children: [

        const Text(
          "Get in touch",
          style: TextStyle(
            fontSize: AppFonts.aboutFDesk,
            fontWeight: FontWeight.bold,
            // color: CustomColor.whitePrimary,
          ),
        ),

        for (int i = 0; i < getInTouchWithMeItems.length; i++)
          HoverShadowContainer(
            child: InkWell(
              onTap: (){
                UrlController.to.openUrl(getInTouchWithMeItems[i]["link"]);
                // getInTouchWithMeItems[i]["title"]
              },
              child: Column(
                children: [
                  Chip(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    backgroundColor: AppColors.GetInTouchBGColor(_themeFindController.isDarkMode.value),
                    label: Text(getInTouchWithMeItems[i]["title"],style: TextStyle(color: AppColors.GetInTouchTextColor(_themeFindController.isDarkMode.value)),),
                    avatar: Image.asset(getInTouchWithMeItems[i]["img"],color: AppColors.GetInTouchIconColor(_themeFindController.isDarkMode.value),),
                  ),
                  SizedBox(height: 5,)
                ],
              ),
            ),
          ),


      ],
    );
  }
}
