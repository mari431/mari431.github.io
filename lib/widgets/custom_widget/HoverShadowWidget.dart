import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';

class HoverShadowContainer extends StatefulWidget {
  final Widget child;

  HoverShadowContainer({required this.child});

  @override
  _HoverShadowContainerState createState() => _HoverShadowContainerState();
}

class _HoverShadowContainerState extends State<HoverShadowContainer> {
  bool _isHovering = false;
  final ThemeController _themeFindController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isHovering
              ? [
            BoxShadow(
              color: AppColors.CompanyIWorkedConShadowColor(_themeFindController.isDarkMode.value),
              // color: Colors.black.withOpacity(0.3),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}