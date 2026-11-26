import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/skill_items.dart';

class CompanyIWorked extends StatelessWidget {
  CompanyIWorked({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();

  static const Color _accent = Color(0xFF7667F8);

  Future<void> _openCompany(String url, BuildContext context) async {
    final uri = Uri.tryParse(url);
    if (uri == null || !await canLaunchUrl(uri)) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to open this company website.')),
      );
      return;
    }
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? const Color(0xFFF4F2FF) : const Color(0xFF19182A);
      final muted = isDark ? const Color(0xFFB9B6CB) : const Color(0xFF68677A);
      final card = isDark ? const Color(0xFF1D1C2D) : Colors.white;
      final border = isDark ? Colors.white.withOpacity(.10) : const Color(0xFFE8E6F1);
      final shadow = Colors.black.withOpacity(isDark ? .12 : .045);

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 52),
        color: isDark ? const Color(0xFF151522) : const Color(0xFFF7F6FC),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1080),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MY PROFESSIONAL JOURNEY',
                  style: TextStyle(color: _accent, fontSize: 11, letterSpacing: 1.8, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10),
                Text(
                  'Companies I’ve worked with',
                  style: TextStyle(color: foreground, fontSize: 27, fontWeight: FontWeight.w800, letterSpacing: -.5),
                ),
                const SizedBox(height: 9),
                Text(
                  'A few of the teams and organizations I’ve had the opportunity to contribute to.',
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
                      for (final company in companyIWorkedWith)
                        SizedBox(
                          width: itemWidth,
                          child: Material(
                            color: card,
                            borderRadius: BorderRadius.circular(16),
                            elevation: 0,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () => _openCompany(company['url'] as String, context),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: border),
                                  boxShadow: [BoxShadow(color: shadow, blurRadius: 18, offset: const Offset(0, 6))],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      padding: const EdgeInsets.all(9),
                                      decoration: BoxDecoration(
                                        color: isDark ? Colors.white.withOpacity(.07) : const Color(0xFFF4F2FC),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image.asset(company['img'] as String, fit: BoxFit.contain),
                                    ),
                                    const SizedBox(width: 13),
                                    Expanded(
                                      child: Text(
                                        company['title'] as String,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: foreground, fontSize: 13, fontWeight: FontWeight.w700, height: 1.35),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(Icons.north_east_rounded, color: muted, size: 17),
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
