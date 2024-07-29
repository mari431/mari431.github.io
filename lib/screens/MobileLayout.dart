import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/MenuNController.dart';

class MobileLayout extends StatelessWidget {
  final MenuNController _menuController = Get.find<MenuNController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        switch (_menuController.selectedIndex.value) {
          case 0:
            return Text('Home Page - Mobile');
          case 1:
            return Text('Profile Page - Mobile');
          case 2:
            return Text('Settings Page - Mobile');
          default:
            return Text('Home Page - Mobile');
        }
      }),
    );
  }
}