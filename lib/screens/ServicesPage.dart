import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';

class ServicesPage extends StatelessWidget {
  ServicesPage({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();
  static const Color _accent = Color(0xFF7667F8);

  static const List<_Service> _services = [
    _Service(Icons.phone_iphone_rounded, 'Mobile app development', 'Cross-platform Android and iOS applications with Flutter, responsive interfaces and maintainable state management.', ['Flutter', 'Dart', 'GetX / Bloc']),
    _Service(Icons.web_rounded, 'Web applications', 'Responsive web apps and dashboards that help teams manage customers, operations and business data.', ['Flutter Web', 'PWA', 'Responsive UI']),
    _Service(Icons.account_tree_rounded, 'Backend & API development', 'REST APIs, authentication, integrations and service layers designed to keep applications connected and dependable.', ['Node.js', 'Express', 'REST APIs']),
    _Service(Icons.storage_rounded, 'Database & Firebase solutions', 'Data modelling, SQL queries and stored procedures, plus Firebase services for real-time and cloud-backed features.', ['Microsoft SQL Server', 'Firestore', 'FCM']),
    _Service(Icons.business_center_rounded, 'Business workflow solutions', 'Practical tools for operational workflows such as ERP modules, attendance, reporting and role-based dashboards.', ['ERP workflows', 'Reports', 'Role-based access']),
    _Service(Icons.build_circle_outlined, 'App improvement & integration', 'Feature enhancements, third-party integrations, performance refinement and release support for existing applications.', ['Payments', 'Maps', 'CI/CD']),
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
        color: isDark ? const Color(0xFF151522) : const Color(0xFFF4F2FC),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('WHAT I CAN HELP WITH', style: TextStyle(color: _accent, fontSize: 11, letterSpacing: 1.8, fontWeight: FontWeight.w800)),
              const SizedBox(height: 13),
              Text('Digital solutions, from idea to delivery.', style: TextStyle(color: foreground, fontSize: 32, height: 1.2, fontWeight: FontWeight.w800, letterSpacing: -.7)),
              const SizedBox(height: 12),
              Text('Flexible development support for new products, internal tools and existing applications.', style: TextStyle(color: muted, fontSize: 15, height: 1.7)),
              const SizedBox(height: 30),
              LayoutBuilder(builder: (context, constraints) {
                final columns = constraints.maxWidth >= 900 ? 3 : (constraints.maxWidth >= 580 ? 2 : 1);
                final itemWidth = (constraints.maxWidth - (columns - 1) * 16) / columns;
                return Wrap(spacing: 16, runSpacing: 16, children: _services.map((service) => SizedBox(
                  width: itemWidth,
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(18), border: Border.all(color: border)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Container(width: 46, height: 46, decoration: BoxDecoration(color: _accent.withOpacity(.13), borderRadius: BorderRadius.circular(13)),
                        child: Icon(service.icon, color: _accent)),
                      const SizedBox(height: 18),
                      Text(service.title, style: TextStyle(color: foreground, fontSize: 17, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 10),
                      Text(service.description, style: TextStyle(color: muted, fontSize: 13, height: 1.65)),
                      const SizedBox(height: 16),
                      Wrap(spacing: 7, runSpacing: 7, children: service.tags.map((tag) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                        decoration: BoxDecoration(color: _accent.withOpacity(.10), borderRadius: BorderRadius.circular(7)),
                        child: Text(tag, style: const TextStyle(color: _accent, fontSize: 10, fontWeight: FontWeight.w700)),
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

class _Service {
  final IconData icon;
  final String title;
  final String description;
  final List<String> tags;
  const _Service(this.icon, this.title, this.description, this.tags);
}
