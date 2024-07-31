import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/controllers/UrlController.dart';
import 'package:marimuthu_portfolio/controllers/homeController.dart';
import 'package:marimuthu_portfolio/screens/aboutPage.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';
import 'package:marquee_list/marquee_list.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
                      return buildAboutDesktop();
                    }
                    // else
                    return buildAboutMobile();
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

  Row buildAboutDesktop() {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 500,
            height: 500,
            child: Image.asset(AboutUtils.myImage2Str),
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          child: Container(
            width: 500,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About Me',style: TextStyle(fontSize: AppFonts.aboutFDesk),),
                Text(
                  AboutUtils.aboutMeDetail2,
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: AppFonts.aboutBodyDesk,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Expanded(child: SizedBox(
                  width: 280,
                  height: 25,
                  child: MarqueeList(
                    scrollDirection: Axis.horizontal,
                    scrollDuration: Duration(seconds: 2),
                    children: [
                      for (int i = 0; i < AboutUtils.mySkilles.length; i++)
                        Row(
                          children: [
                            Text(AboutUtils.mySkilles[i]),
                            Text(','),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                    ],
                  ),
                ),
                )


              ],
            ),
          ),
        ),




      ],
    );
  }

  Column buildAboutMobile() {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 500,
            height: 100,
            child: Image.asset(AboutUtils.myImage2Str),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: Container(
            width: 500,
            height: 300,
            child: Column(
              children: [
                Text('About Me',style: TextStyle(fontSize: AppFonts.aboutFDesk),),
                Text(
            AboutUtils.aboutMeDetail2,
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: AppFonts.aboutFMob,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(child: SizedBox(
          width: 280,
          height: 25,
          child: MarqueeList(
            scrollDirection: Axis.horizontal,
            scrollDuration: Duration(seconds: 2),
            children: [
              for (int i = 0; i < AboutUtils.mySkilles.length; i++)
                Row(
                  children: [
                    Text(AboutUtils.mySkilles[i]),
                    Text(','),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
            ],
          ),
        ),
        )

      ],
    );
  }
}
