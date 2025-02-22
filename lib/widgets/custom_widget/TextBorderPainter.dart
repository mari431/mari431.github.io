import 'package:flutter/material.dart';

class TextBorderPainter extends CustomPainter {
  final String text;

  TextBorderPainter(this.text);

  @override
  void paint(Canvas canvas, Size size) {
    final TextStyle textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      // color: Colors.black, // Text color
    );
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    // Create the border effect by painting a stroke around the text
    final Paint paint = Paint()
      ..color = Colors.grey // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    textPainter.paint(canvas, Offset(0, 0));

    // Draw the border around the text
    textPainter.paint(canvas, Offset(0, 0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}




class TextWithBorder extends StatelessWidget {
  final String text;

  TextWithBorder(this.text);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TextBorderPainter(text),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          // color: Colors.black, // Text color
        ),
      ),
    );
  }
}