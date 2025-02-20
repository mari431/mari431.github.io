import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WavingEmoji extends StatefulWidget {
  @override
  _WavingEmojiState createState() => _WavingEmojiState();
}

class _WavingEmojiState extends State<WavingEmoji> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
      lowerBound: -0.2,
      upperBound: 0.2,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value,
          child: Text(
            '👋',
            style: TextStyle(fontSize: 40),
          ),
        );
      },
    );
  }
}
