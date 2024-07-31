import 'package:flutter/material.dart';
import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';

import '../constants/skill_items.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                  maxHeight: 500,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth >= kMinDesktopWidth) {
                      return buildSkillDesktop();
                    }

                    // else
                    return buildSkillMobile();
                  },
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Row buildSkillDesktop() {
    return Row(
      children: [
        // platforms
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    // color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    leading: Image.asset(
                      platformItems[i]["img"],
                      width: 26.0,
                    ),
                    title: Text(platformItems[i]["title"]),
                  ),
                )
            ],
          ),
        ),
        const SizedBox(width: 50),
        // skills
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  Chip(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    // backgroundColor: CustomColor.bgLight2,
                    label: Text(skillItems[i]["title"]),
                    avatar: Image.asset(skillItems[i]["img"]),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Column buildSkillMobile() {
    return Column(
      children: [

        for (int i = 0; i < platformItems.length; i++)
          Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            width: double.maxFinite,
            decoration: BoxDecoration(
              // color: CustomColor.bgLight2,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              leading: Image.asset(
                platformItems[i]["img"],
                width: 26.0,
              ),
              title: Text(platformItems[i]["title"]),
            ),
          ),
        const SizedBox(height: 50),

        // skills
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.center,
          children: [
            for (int i = 0; i < skillItems.length; i++)
              Chip(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16.0,
                ),
                // backgroundColor: CustomColor.bgLight2,
                label: Text(skillItems[i]["title"]),
                avatar: Image.asset(skillItems[i]["img"]),
              ),
          ],
        )
      ],
    );
  }
}