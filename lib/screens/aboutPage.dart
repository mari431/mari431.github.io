import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/controllers/UrlController.dart';
import 'package:marimuthu_portfolio/controllers/homeController.dart';
import 'package:marimuthu_portfolio/screens/aboutPage.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';
import 'package:marquee_list/marquee_list.dart';

class AboutPage extends StatelessWidget {
   AboutPage({super.key});

  final ThemeController _themeFindController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
        color: AppColors.aboutBgColor(_themeFindController.isDarkMode.value),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
              Container(
                width: Get.width,
                height: 500,
                // constraints: const BoxConstraints(
                //   maxWidth: 700,
                //   maxHeight: 500,
                // ),
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
              // const SizedBox(height: 15),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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

                // Expanded(child: SizedBox(
                //   width: 280,
                //   height: 25,
                //   child: MarqueeList(
                //     scrollDirection: Axis.horizontal,
                //     scrollDuration: Duration(seconds: 2),
                //     children: [
                //       for (int i = 0; i < AboutUtils.mySkilles.length; i++)
                //         Row(
                //           children: [
                //             Text(AboutUtils.mySkilles[i]),
                //             Text(','),
                //             SizedBox(
                //               width: 10,
                //             )
                //           ],
                //         ),
                //     ],
                //   ),
                // ),
                // )


              ],
            ),
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          child: Container(
            width: 500,
            height: 500,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(color: Colors.lightGreenAccent),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(AboutUtils.myImage2Str,fit: BoxFit.fill),
              ),
            ),
            // child: Image.asset(AboutUtils.myImage2Str),
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
            height: 500,
            child: Image.asset(AboutUtils.myImage2Str),
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: Container(
            width: 500,
            height: 500,
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
        // const SizedBox(height: 5),
        // Expanded(child: SizedBox(
        //   width: 280,
        //   height: 25,
        //   child: MarqueeList(
        //     scrollDirection: Axis.horizontal,
        //     scrollDuration: Duration(seconds: 2),
        //     children: [
        //       for (int i = 0; i < AboutUtils.mySkilles.length; i++)
        //         Row(
        //           children: [
        //             Text(AboutUtils.mySkilles[i]),
        //             Text(','),
        //             SizedBox(
        //               width: 10,
        //             )
        //           ],
        //         ),
        //     ],
        //   ),
        // ),
        // )

      ],
    );
  }
}
