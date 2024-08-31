import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';

class Logo_wdget extends StatelessWidget {
  final VoidCallback onTap;


   Logo_wdget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final ThemeController _themeFindController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: Image.asset(AboutUtils.navLogo(_themeFindController.isDarkMode.value),fit: BoxFit.contain),
      ),
    );
  }
}
