import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/h_Nav_Item.dart';
import 'package:marimuthu_portfolio/controllers/DownloadController.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/widgets/ThemeToggleButton.dart';

class DrawerMobile extends StatelessWidget {
  DrawerMobile({
    super.key,
    required this.onNavItemTap,
  });

  final Function(int) onNavItemTap;
  final ThemeController _themeController = Get.find<ThemeController>();
  final DownloadController _downloadController = Get.put(DownloadController());

  static const List<int> _visibleNavIndexes = [0, 1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? Colors.white : const Color(0xFF172033);
      final muted = isDark ? Colors.white60 : const Color(0xFF667085);

      return Drawer(
        width: MediaQuery.of(context).size.width < 360 ? 300 : 330,
        backgroundColor: isDark ? const Color(0xFF111827) : Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 18, 14, 22),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF6D5DFB), Color(0xFF3977F6)]),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      alignment: Alignment.center,
                      child: const Text('MK', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Marimuthu', style: TextStyle(color: foreground, fontWeight: FontWeight.w800, fontSize: 16)),
                          Text('Software Developer', style: TextStyle(color: muted, fontSize: 11)),
                        ],
                      ),
                    ),
                    IconButton(
                      tooltip: 'Close menu',
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close_rounded, color: foreground),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: isDark ? Colors.white12 : const Color(0xFFE7EAF0)),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  children: [
                    for (final index in _visibleNavIndexes)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Material(
                          color: isDark ? Colors.white.withOpacity(.035) : const Color(0xFFF8F9FC),
                          borderRadius: BorderRadius.circular(12),
                          child: ListTile(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                            leading: Icon(navIcons[index], color: muted, size: 20),
                            title: Text(navTitles[index], style: TextStyle(color: foreground, fontSize: 14, fontWeight: FontWeight.w600)),
                            trailing: Icon(Icons.arrow_forward_ios_rounded, color: muted, size: 13),
                            onTap: () => onNavItemTap(index),
                          ),
                        ),
                      ),
                    const SizedBox(height: 12),
                    Obx(() => _downloadController.isDownloading.value
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: () => _downloadController.downloadAssetsFile(
                                'assets/Marimuthu_Kannayiram_Flutter_developer.pdf',
                                'Marimuthu_Kannayiram_Flutter_developer.pdf',
                              ),
                              icon: const Icon(Icons.download_rounded, size: 18),
                              label: const Text('Download Resume', style: TextStyle(fontWeight: FontWeight.w700)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6D5DFB),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          )),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: () => onNavItemTap(6),
                        icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
                        label: const Text('Let’s talk', style: TextStyle(fontWeight: FontWeight.w700)),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: foreground,
                          side: BorderSide(color: isDark ? Colors.white24 : const Color(0xFFD0D5DD)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: isDark ? Colors.white12 : const Color(0xFFE7EAF0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                child: Row(
                  children: [
                    Icon(isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined, color: muted, size: 18),
                    const SizedBox(width: 10),
                    Expanded(child: Text('Appearance', style: TextStyle(color: foreground, fontWeight: FontWeight.w600))),
                    ThemeToggleButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
