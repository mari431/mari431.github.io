import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';

class Footer extends StatelessWidget {
  Footer({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? const Color(0xFFB9B6CB) : const Color(0xFF68677A);
      final border = isDark ? Colors.white.withOpacity(.08) : Colors.black.withOpacity(.07);
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF10101A) : const Color(0xFFF4F2FC),
          border: Border(top: BorderSide(color: border)),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1080),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 10,
              children: [
                Text('© ${DateTime.now().year} ${AboutUtils.myFName} ${AboutUtils.myLName}',
                  style: TextStyle(color: foreground, fontSize: 12, fontWeight: FontWeight.w600)),
                Text('Designed & built with Flutter',
                  style: TextStyle(color: foreground, fontSize: 12)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
