import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ShowcaseController.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';
import 'package:marimuthu_portfolio/widgets/custom_widget/GlowText.dart';

class ShowcaseScreen extends StatelessWidget {
  final controller = Get.put(ShowcaseController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => AnimatedOpacity(
        duration: Duration(seconds: 2),
        opacity: controller.isVisible.value ? 1.0 : 0.0,
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          transform: controller.isVisible.value
              ? Matrix4.translationValues(0, 0, 0)
              : Matrix4.translationValues(-100, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi,\nI'm ${AboutUtils.myFName} ${AboutUtils.myLName}",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GlowText("A ${AboutUtils.aboutPosition}", 28, Colors.purpleAccent),
              SizedBox(height: 10),
              // GlowText("Software Engineer", 24, Colors.orange),
              // SizedBox(height: 5),
              GlowText("GetX | Bloc | Firebase | Node.js | SQL", 20, Colors.green),
            ],
          ),
        ),
      )),
    );
  }
}