import 'package:flutter/material.dart';
import 'package:marimuthu_portfolio/widgets/custom_widget/CirclePainter.dart';

class OpenToWorkAnimation extends StatefulWidget {
  @override
  _OpenToWorkAnimationState createState() => _OpenToWorkAnimationState();
}

class _OpenToWorkAnimationState extends State<OpenToWorkAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

    String wavingHand = "👋";
  String openToWorkEmoji = "💼";
  String openToWork = "Open to Work";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scale: _animation.value,
                  child: CustomPaint(
                    size: Size(25, 55), // Adjust size of the circle
                    painter: CirclePainter(),
                  ),
                ),
                Text(
                  '$openToWorkEmoji',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                ),

              ],
            );
          },
        ),
        Text(
          '$openToWork',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
        ),
      ],
    );
  }
}