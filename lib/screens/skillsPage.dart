import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';

class SkillsPage extends StatelessWidget {
  SkillsPage({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();
  static const Color _accent = Color(0xFF7667F8);

  static const List<_SkillGroup> _groups = [
    _SkillGroup('Application development', 'Building the user experience across devices.', ['Flutter', 'Dart', 'GetX', 'Bloc', 'Provider', 'Responsive UI']),
    _SkillGroup('Backend & APIs', 'Connecting applications to secure and reliable services.', ['Node.js', 'Express.js', 'NestJS', 'REST APIs', 'JWT Authentication']),
    _SkillGroup('Data & cloud', 'Designing storage, queries and cloud-backed features.', ['Microsoft SQL Server', 'Stored Procedures', 'Firebase', 'Firestore', 'Authentication', 'FCM']),
    _SkillGroup('Delivery & integrations', 'Shipping applications and connecting useful services.', ['Git', 'GitHub Actions', 'Fastlane', 'Firebase App Distribution', 'Google Maps', 'Razorpay']),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? const Color(0xFFF4F2FF) : const Color(0xFF19182A);
      final muted = isDark ? const Color(0xFFB9B6CB) : const Color(0xFF68677A);
      final card = isDark ? const Color(0xFF191927) : Colors.white;
      final border = isDark ? Colors.white12 : Colors.black.withOpacity(.07);

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 72),
        color: isDark ? const Color(0xFF11111D) : const Color(0xFFFAF9FF),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('TOOLS & TECHNOLOGIES', style: TextStyle(color: _accent, fontSize: 11, letterSpacing: 1.8, fontWeight: FontWeight.w800)),
              const SizedBox(height: 13),
              Text('A practical full-stack toolkit.', style: TextStyle(color: foreground, fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -.7)),
              const SizedBox(height: 12),
              Text('The technologies I use to design, build, connect and ship digital products.', style: TextStyle(color: muted, fontSize: 15, height: 1.7)),
              const SizedBox(height: 30),
              LayoutBuilder(builder: (context, constraints) {
                final columns = constraints.maxWidth >= 850 ? 2 : 1;
                final itemWidth = (constraints.maxWidth - (columns - 1) * 16) / columns;
                return Wrap(spacing: 16, runSpacing: 16, children: _groups.map((group) => SizedBox(
                  width: itemWidth,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(18), border: Border.all(color: border)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(group.title, style: TextStyle(color: foreground, fontSize: 18, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 7),
                      Text(group.description, style: TextStyle(color: muted, fontSize: 13, height: 1.5)),
                      const SizedBox(height: 18),
                      Wrap(spacing: 8, runSpacing: 8, children: group.skills.map((skill) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                        decoration: BoxDecoration(color: _accent.withOpacity(.10), borderRadius: BorderRadius.circular(8)),
                        child: Text(skill, style: const TextStyle(color: _accent, fontSize: 12, fontWeight: FontWeight.w700)),
                      )).toList()),
                    ]),
                  ),
                )).toList());
              }),
            ]),
          ),
        ),
      );
    });
  }
}

class _SkillGroup {
  final String title;
  final String description;
  final List<String> skills;
  const _SkillGroup(this.title, this.description, this.skills);
}
