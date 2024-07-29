import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';

class ThemeToggleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find();
    return Obx(
          () => IconButton(
        icon: Icon(
          _themeController.isDarkMode.value
              ? Icons.dark_mode
              : Icons.light_mode,
        ),
        onPressed: () {
          _themeController.toggleTheme();
        },
      ),
    );
  }
}
