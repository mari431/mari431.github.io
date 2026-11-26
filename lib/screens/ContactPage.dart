import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/controllers/UrlController.dart';
import 'package:marimuthu_portfolio/controllers/contactController.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  final ThemeController _themeController = Get.find<ThemeController>();
  static const Color _accent = Color(0xFF7667F8);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDark = _themeController.isDarkMode.value;
      final foreground = isDark ? const Color(0xFFF4F2FF) : const Color(0xFF19182A);
      final muted = isDark ? const Color(0xFFB9B6CB) : const Color(0xFF68677A);
      final surface = isDark ? const Color(0xFF191927) : Colors.white;
      final border = isDark ? Colors.white12 : Colors.black.withOpacity(.08);

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 76),
        color: isDark ? const Color(0xFF151522) : const Color(0xFFF4F2FC),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: LayoutBuilder(builder: (context, constraints) {
              final form = _messageForm(surface, border, foreground, muted);
              final details = _contactDetails(foreground, muted, surface, border);
              if (constraints.maxWidth < 760) {
                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  _heading(foreground, muted),
                  const SizedBox(height: 28),
                  form,
                  const SizedBox(height: 24),
                  details,
                ]);
              }
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _heading(foreground, muted),
                const SizedBox(height: 30),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(flex: 6, child: form),
                  const SizedBox(width: 24),
                  Expanded(flex: 4, child: details),
                ]),
              ]);
            }),
          ),
        ),
      );
    });
  }

  Widget _heading(Color foreground, Color muted) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text('LET’S WORK TOGETHER', style: TextStyle(color: _accent, fontSize: 11, letterSpacing: 1.8, fontWeight: FontWeight.w800)),
    const SizedBox(height: 13),
    Text('Have a project in mind?', style: TextStyle(color: foreground, fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -.7)),
    const SizedBox(height: 10),
    Text('Tell me what you’re planning. I’m open to software development opportunities, collaborations and practical business technology projects.', style: TextStyle(color: muted, fontSize: 15, height: 1.7)),
  ]);

  Widget _messageForm(Color surface, Color border, Color foreground, Color muted) {
    final controller = Contactcontroller.to;
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(color: surface, borderRadius: BorderRadius.circular(18), border: Border.all(color: border)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Start a conversation', style: TextStyle(color: foreground, fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        Text('Share a few details and your email app will open with a message addressed to me.', style: TextStyle(color: muted, fontSize: 13, height: 1.5)),
        const SizedBox(height: 18),
        TextField(
          controller: controller.nameController,
          minLines: 5,
          maxLines: 7,
          style: TextStyle(color: foreground),
          decoration: InputDecoration(
            hintText: 'What would you like to build or discuss?',
            hintStyle: TextStyle(color: muted),
            filled: true,
            fillColor: border.withOpacity(.22),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: border)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: border)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: _accent)),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: FilledButton.icon(
          onPressed: () {
            if (controller.nameController.text.trim().isEmpty) {
              Get.snackbar('Message needed', 'Please add a short message before continuing.');
              return;
            }
            controller.sendMail();
          },
          icon: const Icon(Icons.mail_outline_rounded),
          label: const Text('Send an enquiry'),
          style: FilledButton.styleFrom(backgroundColor: _accent, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 17), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))),
        )),
      ]),
    );
  }

  Widget _contactDetails(Color foreground, Color muted, Color surface, Color border) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(color: surface, borderRadius: BorderRadius.circular(18), border: Border.all(color: border)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Direct contact', style: TextStyle(color: foreground, fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 17),
        _detail(Icons.email_outlined, 'Email', 'marimuthu.k.it@gmail.com', foreground, muted),
        const SizedBox(height: 15),
        _detail(Icons.location_on_outlined, 'Based in', 'Ahmedabad, Gujarat, India', foreground, muted),
        const SizedBox(height: 22),
        const Divider(),
        const SizedBox(height: 12),
        Text('Find me online', style: TextStyle(color: foreground, fontSize: 14, fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        Wrap(spacing: 8, runSpacing: 8, children: [
          _socialButton('GitHub', Icons.code_rounded, 'https://github.com/mari431'),
          _socialButton('LinkedIn', Icons.work_outline_rounded, 'https://www.linkedin.com/in/marimuthu-k-2015it19/'),
        ]),
      ]),
    );
  }

  Widget _detail(IconData icon, String label, String value, Color foreground, Color muted) => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Icon(icon, color: _accent, size: 20),
    const SizedBox(width: 12),
    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: TextStyle(color: muted, fontSize: 12)),
      const SizedBox(height: 3),
      SelectableText(value, style: TextStyle(color: foreground, fontSize: 14, fontWeight: FontWeight.w600)),
    ])),
  ]);

  Widget _socialButton(String label, IconData icon, String url) => OutlinedButton.icon(
    onPressed: () => UrlController.to.openUrl(url),
    icon: Icon(icon, size: 17),
    label: Text(label),
    style: OutlinedButton.styleFrom(foregroundColor: _accent, side: const BorderSide(color: Color(0x337667F8)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))),
  );
}
