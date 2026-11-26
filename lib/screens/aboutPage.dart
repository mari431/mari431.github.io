import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();
  static const Color _accent = Color(0xFF7667F8);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? const Color(0xFFF4F2FF) : const Color(0xFF19182A);
      final muted = isDark ? const Color(0xFFB9B6CB) : const Color(0xFF68677A);
      final surface = isDark ? const Color(0xFF191927) : Colors.white;
      final border = isDark ? Colors.white12 : Colors.black.withOpacity(.07);

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 76),
        color: isDark ? const Color(0xFF11111D) : const Color(0xFFFAF9FF),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _eyebrow('A LITTLE ABOUT ME'),
                const SizedBox(height: 14),
                Text('A developer who thinks beyond the screen.',
                    style: TextStyle(color: foreground, fontSize: 34, height: 1.18, fontWeight: FontWeight.w800, letterSpacing: -.8)),
                const SizedBox(height: 18),
                LayoutBuilder(builder: (context, constraints) {
                  final compact = constraints.maxWidth < 760;
                  final story = _story(foreground, muted);
                  final portrait = _portrait(surface, border);
                  if (compact) {
                    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      portrait,
                      const SizedBox(height: 28),
                      story,
                    ]);
                  }
                  return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Expanded(flex: 5, child: story),
                    const SizedBox(width: 64),
                    Expanded(flex: 4, child: portrait),
                  ]);
                }),
                const SizedBox(height: 34),
                Wrap(spacing: 14, runSpacing: 14, children: [
                  _factCard('5+ years', 'Software development', surface, border, foreground, muted),
                  _factCard('Flutter', 'Primary application stack', surface, border, foreground, muted),
                  _factCard('End to end', 'UI, APIs and data', surface, border, foreground, muted),
                ]),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _story(Color foreground, Color muted) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'I’m Marimuthu Kannayiram, a Software Developer & Independent Technology Consultant. I build cross-platform applications and the backend systems that support them.',
        style: TextStyle(color: foreground, fontSize: 17, height: 1.7, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 16),
      Text(
        'My core focus is Flutter development for Android, iOS and web, supported by Node.js APIs, Firebase services and Microsoft SQL Server. I enjoy turning real business requirements into practical products — from customer-facing apps to internal dashboards and workflow tools.',
        style: TextStyle(color: muted, fontSize: 15, height: 1.8),
      ),
      const SizedBox(height: 16),
      Text(
        'I care about maintainable architecture, clear data flows, reliable integrations and smooth releases. I work collaboratively, communicate openly and keep the solution focused on the problem it needs to solve.',
        style: TextStyle(color: muted, fontSize: 15, height: 1.8),
      ),
      const SizedBox(height: 22),
      Wrap(spacing: 9, runSpacing: 9, children: const [
        _Tag('Product-minded'),
        _Tag('Full-stack perspective'),
        _Tag('Business-focused'),
      ]),
    ]);
  }

  Widget _portrait(Color surface, Color border) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: surface, borderRadius: BorderRadius.circular(24), border: Border.all(color: border)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: AspectRatio(
          aspectRatio: 5 / 4,
          child: Image.asset(AboutUtils.myImage2Str, fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Image.asset(AboutUtils.myImageStr, fit: BoxFit.cover)),
        ),
      ),
    );
  }

  Widget _factCard(String value, String label, Color surface, Color border, Color foreground, Color muted) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: surface, borderRadius: BorderRadius.circular(16), border: Border.all(color: border)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(value, style: const TextStyle(color: _accent, fontSize: 22, fontWeight: FontWeight.w800)),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(color: muted, fontSize: 13)),
      ]),
    );
  }

  Widget _eyebrow(String text) => Text(text, style: const TextStyle(color: _accent, fontSize: 11, letterSpacing: 1.8, fontWeight: FontWeight.w800));
}

class _Tag extends StatelessWidget {
  const _Tag(this.label);
  final String label;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(color: const Color(0xFF7667F8).withOpacity(.10), borderRadius: BorderRadius.circular(30)),
    child: Text(label, style: const TextStyle(color: Color(0xFF8C80FF), fontSize: 12, fontWeight: FontWeight.w700)),
  );
}
