import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/screens/HomeMain.dart';

final ThemeController _themeFindController = Get.find<ThemeController>();

class CursorParallaxEffect extends StatefulWidget {
  @override
  _CursorParallaxEffectState createState() => _CursorParallaxEffectState();
}

class _CursorParallaxEffectState extends State<CursorParallaxEffect> {
  Offset mousePosition = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            mousePosition = event.position;
          });
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: ParallaxPainter(mousePosition),
              ),
            ),
            Center(
              child: Text(
                "🚀 Flutter Developer Showcase",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParallaxPainter extends CustomPainter {
  final Offset mousePosition;
  ParallaxPainter(this.mousePosition);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blueAccent.withOpacity(0.2);
    final center = size.center(Offset.zero);
    final offsetX = (mousePosition.dx - center.dx) * 0.02;
    final offsetY = (mousePosition.dy - center.dy) * 0.02;

    // Draw moving circles
    for (int i = 0; i < 5; i++) {
      canvas.drawCircle(
        Offset(center.dx + offsetX * i, center.dy + offsetY * i),
        180 - (i * 20),
        paint..color = Colors.blue.withOpacity(0.2 + (i * 0.1)),
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}





///----------------dotted
class DottedBackgroundScreen extends StatefulWidget {
  @override
  _DottedBackgroundScreenState createState() => _DottedBackgroundScreenState();
}

class _DottedBackgroundScreenState extends State<DottedBackgroundScreen> {
  Offset? mousePosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.fullBGColor(_themeFindController.isDarkMode.value),
      body: MouseRegion(
        onHover: (event) {
          setState(() {
            mousePosition = event.position;
          });
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: DottedBackgroundPainter(mousePosition),
              ),
            ),
            Center(child: HomeMain()),
            // Center(
            //   child: Text(
            //     "🚀 Flutter Developer Showcase",
            //     style: TextStyle(fontSize: 24, color: Colors.white),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class DottedBackgroundPainter extends CustomPainter {
  final Offset? mousePosition;
  DottedBackgroundPainter(this.mousePosition);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.fullBGDottedColor(_themeFindController.isDarkMode.value);
    final double dotSpacing = 20; // Spacing between dots

    for (double x = 0; x < size.width; x += dotSpacing) {
      for (double y = 0; y < size.height; y += dotSpacing) {
        double distance = mousePosition != null
            ? (Offset(x, y) - mousePosition!).distance
            : double.infinity;

        double radius = 0.1; // Default dot size
        if (distance < 150) {
          radius = 6 - (distance / 50); // Increase size near cursor
        }

        canvas.drawCircle(Offset(x, y), max(radius, 2), paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}