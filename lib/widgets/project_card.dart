import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/utils/project_utils.dart';

class ProjectCardWidget extends StatelessWidget {
  ProjectCardWidget({super.key, required this.project});

  final ProjectUtils project;
  final ThemeController _themeController = Get.find<ThemeController>();

  static const Color _accent = Color(0xFF7667F8);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground =
          isDark ? const Color(0xFFF4F2FF) : const Color(0xFF19182A);
      final muted =
          isDark ? const Color(0xFFB9B6CB) : const Color(0xFF68677A);
      final surface = isDark ? const Color(0xFF1B1A2A) : Colors.white;
      final border =
          isDark ? Colors.white.withOpacity(.10) : const Color(0xFFE8E6F1);
      final hasLinks = project.iosLink != null ||
          project.androidLink != null ||
          project.webLink != null ||
          (project.desktop != null && project.desktop!.startsWith('http'));

      return Container(
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? .14 : .045),
              blurRadius: 22,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                project.image,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: isDark
                      ? const Color(0xFF28263B)
                      : const Color(0xFFECEAF6),
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: _accent,
                      size: 36,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 16, 17, 7),
              child: Text(
                project.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: foreground,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 0, 17, 14),
              child: Text(
                project.subtitle,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: muted, fontSize: 12, height: 1.6),
              ),
            ),
            if (hasLinks)
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 17, 12),
                child: Row(
                  children: [
                    const Text(
                      'Explore project',
                      style: TextStyle(
                        color: _accent,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Spacer(),
                    if (project.iosLink != null)
                      _linkIcon(
                        'images/ios_icon.png',
                        isDark ? Colors.white : const Color(0xFF20202A),
                        project.iosLink!,
                      ),
                    if (project.androidLink != null)
                      _linkIcon(
                        'images/android_icon.png',
                        const Color(0xFF35A853),
                        project.androidLink!,
                      ),
                    if (project.webLink != null)
                      _linkIcon(
                        'images/web_icon.png',
                        const Color(0xFF3977F6),
                        project.webLink!,
                      ),
                    if (project.desktop != null &&
                        project.desktop!.startsWith('http'))
                      IconButton(
                        tooltip: 'Open project',
                        onPressed: () =>
                            js.context.callMethod('open', [project.desktop]),
                        icon: Icon(
                          Icons.desktop_mac_outlined,
                          color: muted,
                          size: 19,
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _linkIcon(String asset, Color color, String url) => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Tooltip(
          message: 'Open project',
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () => js.context.callMethod('open', [url]),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Image.asset(asset, width: 18, height: 18, color: color),
            ),
          ),
        ),
      );
}
