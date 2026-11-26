import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/controllers/UrlController.dart';

import '../constants/skill_items.dart';

class GetInTouchWithMePage extends StatelessWidget {
  GetInTouchWithMePage({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();

  static const Color _accent = Color(0xFF7667F8);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? const Color(0xFFF4F2FF) : const Color(0xFF19182A);
      final muted = isDark ? const Color(0xFFB9B6CB) : const Color(0xFF68677A);
      final card = isDark ? const Color(0xFF1D1C2D) : Colors.white;
      final border = isDark ? Colors.white.withOpacity(.10) : const Color(0xFFE8E6F1);
      final sectionBg = isDark ? const Color(0xFF151522) : const Color(0xFFF7F6FC);

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 52),
        color: sectionBg,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1080),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CONNECT WITH ME',
                  style: TextStyle(color: _accent, fontSize: 11, letterSpacing: 1.8, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10),
                Text(
                  'Let’s stay connected',
                  style: TextStyle(color: foreground, fontSize: 27, fontWeight: FontWeight.w800, letterSpacing: -.5),
                ),
                const SizedBox(height: 9),
                Text(
                  'Choose the best way to reach me. I’d be happy to connect about opportunities, collaborations or your next project.',
                  style: TextStyle(color: muted, fontSize: 14, height: 1.6),
                ),
                const SizedBox(height: 26),
                LayoutBuilder(builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 850 ? 3 : constraints.maxWidth >= 540 ? 2 : 1;
                  final itemWidth = (constraints.maxWidth - (columns - 1) * 14) / columns;
                  return Wrap(
                    spacing: 14,
                    runSpacing: 14,
                    children: [
                      for (final item in getInTouchWithMeItems)
                        SizedBox(
                          width: itemWidth,
                          child: Material(
                            color: card,
                            borderRadius: BorderRadius.circular(16),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () => UrlController.to.openUrl(item['link']),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: border),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 46,
                                      height: 46,
                                      padding: const EdgeInsets.all(11),
                                      decoration: BoxDecoration(
                                        color: _accent.withOpacity(isDark ? .18 : .09),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.asset(
                                        item['img'],
                                        fit: BoxFit.contain,
                                        color: isDark ? const Color(0xFFD9D3FF) : _accent,
                                      ),
                                    ),
                                    const SizedBox(width: 13),
                                    Expanded(
                                      child: Text(
                                        item['title'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: foreground, fontSize: 13, fontWeight: FontWeight.w700, height: 1.35),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(Icons.arrow_outward_rounded, color: muted, size: 17),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
