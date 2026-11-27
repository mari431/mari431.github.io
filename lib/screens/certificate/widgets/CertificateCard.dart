import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/CertificateController.dart';
import '../../../controllers/ThemeController.dart';
import '../../../models/certificate_model.dart';

class CertificateCard extends StatelessWidget {
  CertificateCard({super.key, required this.certificate});

  final CertificateModel certificate;
  final CertificateController _certificateController = Get.find<CertificateController>();
  final ThemeController _themeController = Get.find<ThemeController>();

  static const Color _accent = Color(0xFF7667F8);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? const Color(0xFFF4F2FF) : const Color(0xFF19182A);
      final muted = isDark ? const Color(0xFFB9B6CB) : const Color(0xFF68677A);
      final surface = isDark ? const Color(0xFF1B1A2A) : Colors.white;
      final border = isDark ? Colors.white.withOpacity(.10) : const Color(0xFFE8E6F1);

      return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: border),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(isDark ? .14 : .045), blurRadius: 20, offset: const Offset(0, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    certificate.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: isDark ? const Color(0xFF28263B) : const Color(0xFFECEAF6),
                      child: const Icon(Icons.workspace_premium_outlined, color: _accent, size: 48),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(color: const Color(0xE8171725), borderRadius: BorderRadius.circular(20)),
                      child: const Text('CERTIFICATE', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 1)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(certificate.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: foreground, fontSize: 15, fontWeight: FontWeight.w800, height: 1.3)),
                    const SizedBox(height: 6),
                    Text(certificate.issuer, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: muted, fontSize: 12)),
                    const SizedBox(height: 4),
                    Text(certificate.date, style: TextStyle(color: muted, fontSize: 11)),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () => _certificateController.openCertificate(certificate.verifyUrl),
                        icon: const Icon(Icons.open_in_new_rounded, size: 15),
                        label: const Text('View certificate'),
                        style: FilledButton.styleFrom(
                          backgroundColor: _accent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
