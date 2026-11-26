import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/h_Nav_Item.dart';
import 'package:marimuthu_portfolio/controllers/DownloadController.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/widgets/ThemeToggleButton.dart';

class HeaderDesktop extends StatelessWidget {
  HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });

  final Function(int) onNavMenuTap;
  final ThemeController _themeController = Get.find<ThemeController>();
  final DownloadController _downloadController = Get.put(DownloadController());

  static const List<int> _primaryNavIndexes = [0, 1, 2, 3, 5];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? Colors.white : const Color(0xFF172033);
      final muted = isDark ? Colors.white70 : const Color(0xFF667085);
      final surface = isDark ? const Color(0xFF111827).withOpacity(.94) : Colors.white.withOpacity(.96);
      final border = isDark ? Colors.white.withOpacity(.09) : const Color(0xFFE7EAF0);

      return Container(
        height: 76,
        width: double.infinity,
        decoration: BoxDecoration(
          color: surface,
          border: Border(bottom: BorderSide(color: border)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? .16 : .045),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1440),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () => onNavMenuTap(0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6D5DFB), Color(0xFF3977F6)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'MK',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15, letterSpacing: .5),
                          ),
                        ),
                        const SizedBox(width: 11),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('MARIMUTHU', style: TextStyle(color: foreground, fontWeight: FontWeight.w800, fontSize: 13, letterSpacing: 1.1)),
                            Text('SOFTWARE DEVELOPER', style: TextStyle(color: muted, fontWeight: FontWeight.w600, fontSize: 9, letterSpacing: 1.05)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  for (final index in _primaryNavIndexes)
                    _NavLink(
                      title: navTitles[index],
                      muted: muted,
                      onTap: () => onNavMenuTap(index),
                    ),
                  const SizedBox(width: 12),
                  Container(width: 1, height: 28, color: border),
                  const SizedBox(width: 12),
                  TextButton.icon(
                    onPressed: () => onNavMenuTap(6),
                    style: TextButton.styleFrom(
                      foregroundColor: foreground,
                      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.chat_bubble_outline_rounded, size: 16),
                    label: const Text('Let’s talk', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
                  ),
                  const SizedBox(width: 8),
                  Obx(() => _downloadController.isDownloading.value
                      ? const SizedBox(width: 38, height: 38, child: Padding(padding: EdgeInsets.all(9), child: CircularProgressIndicator(strokeWidth: 2)))
                      : IconButton(
                          tooltip: 'Download resume',
                          onPressed: () => _downloadController.downloadAssetsFile(
                            'assets/Marimuthu_Kannayiram_Flutter_developer.pdf',
                            'Marimuthu_Kannayiram_Flutter_developer.pdf',
                          ),
                          style: IconButton.styleFrom(
                            foregroundColor: foreground,
                            backgroundColor: isDark ? Colors.white.withOpacity(.07) : const Color(0xFFF2F4F7),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: const Icon(Icons.download_rounded, size: 19),
                        )),
                  const SizedBox(width: 5),
                  ThemeToggleButton(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.title,
    required this.muted,
    required this.onTap,
  });

  final String title;
  final Color muted;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: TextButton(
          onPressed: widget.onTap,
          style: TextButton.styleFrom(
            foregroundColor: _hovered ? const Color(0xFF7567F8) : widget.muted,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: _hovered ? FontWeight.w700 : FontWeight.w600,
              color: _hovered ? const Color(0xFF7567F8) : widget.muted,
            ),
          ),
        ),
      ),
    );
  }
}
