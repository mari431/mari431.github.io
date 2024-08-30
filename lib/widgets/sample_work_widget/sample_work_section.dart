import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/utils/project_utils.dart';
import 'package:marimuthu_portfolio/widgets/sample_work_widget/sample_work_card.dart';


class SampleWorkSection extends StatelessWidget {
  SampleWorkSection({super.key});

  final ThemeController _themeFindController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
        // color: AppColors.homeBgColor(_themeFindController.isDarkMode.value),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
              // Work projects title
              const Text(
                "Sample Work projects",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  // color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(height: 50),
              // Work projects cards
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Wrap(
                  spacing: 25,
                  runSpacing: 25,
                  children: [
                    for (int i = 0; i < sampleWorkUtils.length; i++)
                      SampleWorkCardWidget(
                        samplework: sampleWorkUtils[i],
                        index:i
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}