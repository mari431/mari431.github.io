import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';

import '../constants/skill_items.dart';

class SkillsPage extends StatelessWidget {
   SkillsPage({super.key});

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
                  maxHeight: 500,
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
          "What I can do",
          style: TextStyle(
            fontSize: AppFonts.aboutFDesk,
            fontWeight: FontWeight.bold,
            // color: CustomColor.whitePrimary,
          ),
        ),
        Row(
          children: [
            // platforms
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 450,
              ),
              child: Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                children: [
                  for (int i = 0; i < platformItems.length; i++)
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          color: AppColors.skillBgColor(_themeFindController.isDarkMode.value),
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                                // color: Colors.grey.withOpacity(0.5),
                                // spreadRadius: 1,
                                // blurRadius: 1,
                                // offset: Offset(0, 0)
                            )
                          ]
                      ),
                      // decoration: BoxDecoration(
                      //   color: AppColors.skillBgColor(_themeFindController.isDarkMode.value),
                      //   borderRadius: BorderRadius.circular(5),
                      // ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        leading: Image.asset(
                          platformItems[i]["img"],
                          width: 26.0,
                          color: AppColors.skillIconColor(_themeFindController.isDarkMode.value),
                        ),
                        title: Text(platformItems[i]["title"],style: TextStyle(color: AppColors.skillTextColor(_themeFindController.isDarkMode.value)),),
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(width: 50),
            // skills
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    for (int i = 0; i < skillItems.length; i++)
                      Chip(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        // backgroundColor: CustomColor.bgLight2,
                        label: Text(skillItems[i]["title"]),
                        avatar: Image.asset(skillItems[i]["img"]),
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
          "What I can do",
          style: TextStyle(
            fontSize: AppFonts.aboutFDesk,
            fontWeight: FontWeight.bold,
            // color: CustomColor.whitePrimary,
          ),
        ),
        for (int i = 0; i < platformItems.length; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: AppColors.skillBgColor(_themeFindController.isDarkMode.value),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 0)
                  )
                ]
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              leading: Image.asset(
                platformItems[i]["img"],
                width: 26.0,
                color: AppColors.skillIconColor(_themeFindController.isDarkMode.value),
              ),
              title: Text(platformItems[i]["title"],),
            ),
          ),
        const SizedBox(height: 5),

        // skills
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.center,
          children: [
            for (int i = 0; i < skillItems.length; i++)
              Chip(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                // backgroundColor: CustomColor.bgLight2,
                label: Text(skillItems[i]["title"]),
                avatar: Image.asset(skillItems[i]["img"]),
              ),
          ],
        )
      ],
    );
  }
}