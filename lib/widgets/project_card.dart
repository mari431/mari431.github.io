import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/utils/project_utils.dart';

class ProjectCardWidget extends StatelessWidget {
  ProjectCardWidget({super.key, required this.project});

  final ProjectUtils project;
  final ThemeController _themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final isDark = _themeController.isDarkMode.value;
    final hasLinks = project.iosLink != null ||
        project.androidLink != null ||
        project.webLink != null ||
        (project.desktop != null && project.desktop!.startsWith('http'));

    return Container(
      width: double.infinity,
      height: 340,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.wProjectBgColor(isDark),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: isDark ? Colors.white12 : Colors.black.withOpacity(.07)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(isDark ? .12 : .04), blurRadius: 24, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: double.infinity,
          height: 165,
          child: Image.asset(
            project.image,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: isDark ? const Color(0xFF252438) : const Color(0xFFEAE8F5),
              child: const Center(child: Icon(Icons.image_not_supported_outlined, size: 34)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 17, 17, 8),
          child: Text(project.title, maxLines: 1, overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(17, 0, 17, 8),
            child: Text(project.subtitle, maxLines: 4, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, height: 1.6, color: Colors.grey)),
          ),
        ),
        if (hasLinks)
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 0, 17, 15),
            child: Row(children: [
              const Text('Explore', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
              const Spacer(),
              if (project.iosLink != null)
                _linkIcon('images/ios_icon.png', AppColors.wProjectIosIconColor(isDark), project.iosLink!),
              if (project.androidLink != null)
                _linkIcon('images/android_icon.png', AppColors.wProjectAndroidIconColor(isDark), project.androidLink!),
              if (project.webLink != null)
                _linkIcon('images/web_icon.png', AppColors.wProjectWebIconColor(isDark), project.webLink!),
              if (project.desktop != null && project.desktop!.startsWith('http'))
                IconButton(
                  tooltip: 'Open project',
                  onPressed: () => js.context.callMethod('open', [project.desktop]),
                  icon: const Icon(Icons.desktop_mac_outlined, size: 18),
                ),
            ]),
          )
        else
          const SizedBox(height: 14),
      ]),
    );
  }

  Widget _linkIcon(String asset, Color color, String url) => Padding(
    padding: const EdgeInsets.only(left: 10),
    child: InkWell(
      onTap: () => js.context.callMethod('open', [url]),
      child: Image.asset(asset, width: 18, color: color),
    ),
  );
}
