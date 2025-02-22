import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';
import 'package:marimuthu_portfolio/widgets/custom_widget/TextBorderPainter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/skill_items.dart';

class CompanyIWorked extends StatefulWidget {
  @override
  _CompanyIWorkedState createState() => _CompanyIWorkedState();
}

// class CompanyIWorked extends StatelessWidget {
  class _CompanyIWorkedState extends State<CompanyIWorked> {
  // CompanyIWorked({super.key});

  final ThemeController _themeFindController = Get.find<ThemeController>();
  int? hoveredIndex;

  // Function to open the URL
  _launchURL(String url) async {
      // final String deepLink ='http://globetextiles.net/';
      final String deepLink ='$url';
      final Uri deepLinkUri = Uri.parse(deepLink);
      if (await canLaunchUrl(deepLinkUri)) {
        await launchUrl(deepLinkUri);
      }else{
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Error'),
                content: Text('Failed to launch $deepLink'),
              ),
            );
      }

    // if (await canLaunchUrl(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            hoveredIndex = 1;  // Set the hovered index
          });
        },
        onExit: (_) {
          setState(() {
            hoveredIndex = null;  // Reset the hovered index
          });
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
          decoration: BoxDecoration(
              color: AppColors.skillBgColor(_themeFindController.isDarkMode.value),
              boxShadow: [
                if (hoveredIndex == 1)
                  BoxShadow(
                    // color: Colors.black.withOpacity(0.3),
                    color: AppColors.CompanyIWorkedConShadowColor(_themeFindController.isDarkMode.value),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
              ]
          ),
          // color: AppColors.skillBgColor(_themeFindController.isDarkMode.value),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 700,
                    maxHeight: 120,
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
      ),
    );
  }

  Column buildSkillDesktop() {
    return Column(
      children: [
        const Text(
          "Company I Worked With",
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
              constraints: BoxConstraints(
                maxWidth: Get.width,
              ),
              child: Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                children: [
                  for (int i = 0; i < companyIWorkedWith.length; i++)
                    Container(
                      width: 200,
                      child: Tooltip(
                        message: 'Visit Website',
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 5.0,
                          ),
                          leading: SizedBox(
                            child: Image.asset(
                              companyIWorkedWith[i]["img"],
                              width: 30.0,
                              // color: AppColors.skillIconColor(_themeFindController.isDarkMode.value),
                            ),
                          ),
                          title: Text(companyIWorkedWith[i]["title"],style: TextStyle(color: AppColors.skillTextColor(_themeFindController.isDarkMode.value),fontSize: 12),),
                          // trailing:  GestureDetector(
                          //   onTap: () => _launchURL(companyIWorkedWith[i]['url']!),
                          //   child: Image.asset(
                          //     'assets/images/web_icon.png'
                          //   ),
                          // ),
                        ),
                      ),
                    ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column buildSkillMobile() {
    return Column(
      children: [
        const Text(
          "Company I Worked With",
          style: TextStyle(
            fontSize: AppFonts.aboutFDesk,
            fontWeight: FontWeight.bold,
            // color: CustomColor.whitePrimary,
          ),
        ),
        for (int i = 0; i < companyIWorkedWith.length; i++)
          GestureDetector(
            onTap: () => _launchURL(companyIWorkedWith[i]['url']!),
            child: Container(
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
                  companyIWorkedWith[i]["img"],
                  width: 26.0,
                  // color: AppColors.skillIconColor(_themeFindController.isDarkMode.value),
                ),
                title: Text(companyIWorkedWith[i]["title"],),
              ),
            ),
          ),
      ],
    );
  }
}