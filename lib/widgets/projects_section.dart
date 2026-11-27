import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/widgets/custom_widget/HoverShadowWidget.dart';

import '../utils/project_utils.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? const Color(0xFFF4F2FF) : const Color(0xFF19182A);
      final muted = isDark ? const Color(0xFFB9B6CB) : const Color(0xFF68677A);
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 72),
        color: isDark ? const Color(0xFF151522) : const Color(0xFFF4F2FC),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('SELECTED WORK', style: TextStyle(color: Color(0xFF7667F8), fontSize: 11, letterSpacing: 1.8, fontWeight: FontWeight.w800)),
              const SizedBox(height: 13),
              Text('Projects built for real-world needs.', style: TextStyle(color: foreground, fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -.7)),
              const SizedBox(height: 10),
              Text('A selection of applications and digital experiences across business operations, mobile products and the web.', style: TextStyle(color: muted, fontSize: 15, height: 1.7)),
              const SizedBox(height: 30),
              LayoutBuilder(builder: (context, constraints) {
                final columns = constraints.maxWidth >= 900 ? 3 : (constraints.maxWidth >= 600 ? 2 : 1);
                final itemWidth = (constraints.maxWidth - (columns - 1) * 22) / columns;
                return Wrap(
                  spacing: 22,
                  runSpacing: 22,
                  children: [
                    for (final project in workProjectUtils)
                      SizedBox(width: itemWidth, child: HoverShadowContainer(child: ProjectCardWidget(project: project))),
                  ],
                );
              }),
            ]),
          ),
        ),
      );
    });
  }
}
