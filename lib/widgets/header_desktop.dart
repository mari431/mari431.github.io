import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/constants/h_Nav_Item.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/widgets/ThemeToggleButton.dart';




class HeaderDesktop extends StatelessWidget {
  HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;

  final ThemeController _themeFindController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      width: double.maxFinite,
      // decoration: kHederDecoration,
      child: Row(
        children: [
          // SiteLogo(
          //   onTap: () {},
          // ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Container(
              // width: 70,
              child: Padding(
                padding:  EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: () {
                    onNavMenuTap(i);
                  },
                  child: Text(
                    navTitles[i],
                    style:  TextStyle(
                      fontSize: AppFonts.navBarText,
                      fontWeight: FontWeight.w500,
                      color:  AppColors.navBarTitleTextColor(_themeFindController.isDarkMode.value),
                    ),
                  ),
                ),
              ),
            ),

          ElevatedButton(
              onPressed: (){
                onNavMenuTap(5);
              }, child: Text('Get in Touch')),

          ThemeToggleButton(),
        ],
      ),
    );
  }
}