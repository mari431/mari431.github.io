import 'package:flutter/material.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';


class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Text(
        "Made by ${AboutUtils.myFName} With ❤️ Flutter 3.24.4",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          // color: CustomColor.whiteSecondary,
        ),
      ),
    );
  }
}