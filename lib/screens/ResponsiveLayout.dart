import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/MenuNController.dart';
import 'package:marimuthu_portfolio/screens/MobileLayout.dart';
import 'package:marimuthu_portfolio/screens/WebLayout.dart';

class ResponsiveLayout extends StatelessWidget {
  final MenuNController _menuController = Get.find<MenuNController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (MediaQuery.of(context).size.width < 600) {
        return MobileLayout();
      } else {
        return WebLayout();
      }
    });
  }
}