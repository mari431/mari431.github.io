import 'package:flutter/material.dart';

class GlowText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  GlowText(this.text, this.size, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
        shadows: [
          Shadow(
            blurRadius: 0.5,
            color: color,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }
}