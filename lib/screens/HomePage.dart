import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/DownloadController.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/controllers/UrlController.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
    this.onViewProjects,
    this.onContactTap,
  });

  final VoidCallback? onViewProjects;
  final VoidCallback? onContactTap;
  final ThemeController _themeController = Get.find<ThemeController>();
  final DownloadController _downloadController = Get.put(DownloadController());

  static const Color _accent = Color(0xFF7667F8);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? const Color(0xFFF5F4FF) : const Color(0xFF17172A);
      final muted = isDark ? const Color(0xFFB6B4C8) : const Color(0xFF626176);
      final panel = isDark ? const Color(0xFF171725) : const Color(0xFFF3F2FA);
      final border = isDark ? Colors.white.withOpacity(.10) : Colors.black.withOpacity(.08);

      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? const [Color(0xFF10101B), Color(0xFF171629), Color(0xFF11121D)]
                : const [Color(0xFFFCFBFF), Color(0xFFF4F2FF), Color(0xFFFFFFFF)],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 76),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth >= 760;
                  final intro = _buildIntro(context, foreground, muted, isDark);
                  final portrait = _buildPortrait(context, panel, border, isDark);

                  if (!isWide) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: portrait),
                        const SizedBox(height: 42),
                        intro,
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 6, child: intro),
                      const SizedBox(width: 64),
                      Expanded(flex: 5, child: Center(child: portrait)),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildIntro(
    BuildContext context,
    Color foreground,
    Color muted,
    bool isDark,
  ) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final nameSize = viewportWidth < 380 ? 32.0 : viewportWidth < 760 ? 36.0 : 42.0;
    final headlineSize = viewportWidth < 380 ? 29.0 : viewportWidth < 760 ? 34.0 : 38.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          decoration: BoxDecoration(
            color: _accent.withOpacity(.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: _accent.withOpacity(.30)),
          ),
          child: const Text(
            'SOFTWARE DEVELOPER  ·  TECHNOLOGY CONSULTANT',
            style: TextStyle(
              color: _accent,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.15,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Hello, I’m',
          style: TextStyle(
            color: muted,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '${AboutUtils.myFName} ${AboutUtils.myLName}',
          style: TextStyle(
            color: foreground,
            fontSize: nameSize,
            height: 1.12,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 22),
        Text.rich(
          TextSpan(
            style: TextStyle(
              color: foreground,
              fontSize: headlineSize,
              height: 1.16,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.25,
            ),
            children: const [
              TextSpan(text: 'Engineering Modern '),
              TextSpan(
                text: 'Mobile, Web',
                style: TextStyle(color: _accent),
              ),
              TextSpan(text: ' & Business Applications.'),
            ],
          ),
        ),
        const SizedBox(height: 22),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 610),
          child: Text(
            'I partner with people and businesses to turn ideas into reliable digital products — from polished Flutter experiences to the APIs, databases and workflows that power them.',
            style: TextStyle(
              color: muted,
              fontSize: 16,
              height: 1.75,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 9,
          runSpacing: 9,
          children: const [
            _SkillPill(label: 'Flutter'),
            _SkillPill(label: 'Node.js'),
            _SkillPill(label: 'Firebase'),
            _SkillPill(label: 'Microsoft SQL Server'),
            _SkillPill(label: 'GetX'),
          ],
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: onViewProjects,
              icon: const Icon(Icons.arrow_outward_rounded, size: 18),
              label: const Text('Explore my work'),
              style: FilledButton.styleFrom(
                backgroundColor: _accent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: onContactTap ??
                  () => UrlController.to.openUrl('mailto:marimuthu.k.it@gmail.com'),
              icon: const Icon(Icons.mail_outline_rounded, size: 18),
              label: const Text('Let’s discuss a project'),
              style: OutlinedButton.styleFrom(
                foregroundColor: foreground,
                side: BorderSide(
                  color: isDark ? Colors.white24 : Colors.black26,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            IconButton(
              tooltip: 'GitHub',
              onPressed: () => UrlController.to.openUrl('https://github.com/mari431'),
              icon: const Icon(Icons.code_rounded),
              color: muted,
            ),
            IconButton(
              tooltip: 'LinkedIn',
              onPressed: () => UrlController.to.openUrl(
                'https://www.linkedin.com/in/marimuthu-k-2015it19/',
              ),
              icon: const Icon(Icons.business_center_outlined),
              color: muted,
            ),
            const SizedBox(width: 8),
            TextButton.icon(
              onPressed: () => _downloadController.downloadAssetsFile(
                'assets/Marimuthu_Kannayiram_Flutter_developer.pdf',
                'Marimuthu_Kannayiram_Flutter_developer.pdf',
              ),
              icon: const Icon(Icons.download_rounded, size: 17),
              label: const Text('Download résumé'),
              style: TextButton.styleFrom(foregroundColor: muted),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPortrait(
    BuildContext context,
    Color panel,
    Color border,
    bool isDark,
  ) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 390),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(
            color: _accent.withOpacity(isDark ? .16 : .10),
            blurRadius: 55,
            spreadRadius: 2,
            offset: const Offset(0, 22),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(21),
            child: AspectRatio(
              aspectRatio: 4 / 4.7,
              child: Image.asset(
                AboutUtils.myImageStr,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: panel,
                  child: const Icon(Icons.person_outline, size: 90),
                ),
              ),
            ),
          ),
          Positioned(
            left: 14,
            right: 14,
            bottom: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              decoration: BoxDecoration(
                color: const Color(0xE8171725),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white.withOpacity(.12)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.verified_rounded, color: Color(0xFF8C80FF), size: 19),
                  SizedBox(width: 9),
                  Expanded(
                    child: Text(
                      'Building thoughtful digital experiences',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
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
  }
}

class _SkillPill extends StatelessWidget {
  const _SkillPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(.06) : Colors.white.withOpacity(.8),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: isDark ? Colors.white12 : Colors.black.withOpacity(.08),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isDark ? const Color(0xFFE2E0F0) : const Color(0xFF45445A),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
