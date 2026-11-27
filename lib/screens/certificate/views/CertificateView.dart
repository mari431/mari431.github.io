import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/CertificateController.dart';
import '../../../controllers/ThemeController.dart';
import '../widgets/CertificateCard.dart';

class CertificateView extends StatelessWidget {
  CertificateView({super.key});

  final CertificateController controller = Get.put(CertificateController());
  final ThemeController _themeController = Get.find<ThemeController>();

  static const Color _accent = Color(0xFF7667F8);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? const Color(0xFFF4F2FF) : const Color(0xFF19182A);
      final muted = isDark ? const Color(0xFFB9B6CB) : const Color(0xFF68677A);

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 54),
        color: isDark ? const Color(0xFF11111D) : const Color(0xFFFAF9FF),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1080),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LEARNING & CREDENTIALS',
                  style: TextStyle(color: _accent, fontSize: 11, letterSpacing: 1.8, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10),
                Text(
                  'Certificates & achievements',
                  style: TextStyle(color: foreground, fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: -.5),
                ),
                const SizedBox(height: 9),
                Text(
                  'A selection of courses and credentials that support my ongoing learning.',
                  style: TextStyle(color: muted, fontSize: 14, height: 1.6),
                ),
                const SizedBox(height: 26),
                Obx(() {
                  final certificates = controller.certificates;
                  if (certificates.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28),
                      child: Text('Certificates will appear here soon.', style: TextStyle(color: muted)),
                    );
                  }
                  return LayoutBuilder(builder: (context, constraints) {
                    final columns = constraints.maxWidth >= 850 ? 3 : constraints.maxWidth >= 560 ? 2 : 1;
                    final itemWidth = (constraints.maxWidth - (columns - 1) * 16) / columns;
                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        for (final certificate in certificates)
                          SizedBox(
                            width: itemWidth,
                            height: 370,
                            child: CertificateCard(certificate: certificate),
                          ),
                      ],
                    );
                  });
                }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
