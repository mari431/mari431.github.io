import 'dart:math';

import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.purpleAccent.withOpacity(0.5) // Circle color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final double radius = min(size.width, size.height) / 2;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => false;
}