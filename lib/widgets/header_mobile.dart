import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
  });

  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      final isDark = themeController.isDarkMode.value;
      final foreground = isDark ? Colors.white : const Color(0xFF172033);
      final surface = isDark ? const Color(0xFF111827) : Colors.white;

      return Container(
        height: 68,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: surface.withOpacity(.97),
          border: Border(bottom: BorderSide(color: isDark ? Colors.white12 : const Color(0xFFE7EAF0))),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(isDark ? .12 : .035), blurRadius: 18, offset: const Offset(0, 5)),
          ],
        ),
        child: Row(
          children: [
            InkWell(
              onTap: onLogoTap,
              borderRadius: BorderRadius.circular(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFF6D5DFB), Color(0xFF3977F6)]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text('MK', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14)),
                  ),
                  const SizedBox(width: 10),
                  Text('Marimuthu', style: TextStyle(color: foreground, fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: -.3)),
                ],
              ),
            ),
            const Spacer(),
            Material(
              color: isDark ? Colors.white.withOpacity(.08) : const Color(0xFFF2F4F7),
              borderRadius: BorderRadius.circular(12),
              child: IconButton(
                tooltip: 'Open navigation menu',
                onPressed: onMenuTap,
                icon: Icon(Icons.menu_rounded, color: foreground),
              ),
            ),
          ],
        ),
      );
    });
  }
}
