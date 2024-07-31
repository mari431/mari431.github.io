import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/screens/ContactPage.dart';
import 'package:marimuthu_portfolio/screens/HomePage.dart';
import 'package:marimuthu_portfolio/screens/aboutPage.dart';
import 'package:marimuthu_portfolio/screens/projectsPage.dart';
import 'package:marimuthu_portfolio/screens/skillsPage.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';

import 'package:marimuthu_portfolio/widgets/ThemeToggleButton.dart';


import 'dart:js' as js;

import 'package:marimuthu_portfolio/widgets/drawer_mobile.dart';
import 'package:marimuthu_portfolio/widgets/header_desktop.dart';
import 'package:marimuthu_portfolio/widgets/header_mobile.dart';




class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        // backgroundColor: CustomColor.scaffoldBg,

        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
          scaffoldKey.currentState?.closeEndDrawer();
          scrollToSection(navIndex);
        }),
        body: Column(

          children: [
            // MAIN
            if (constraints.maxWidth >= kMinDesktopWidth)
              HeaderDesktop(
                  onNavMenuTap: (int navIndex) {
                scrollToSection(navIndex);
              }
              )
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
            Container(
              width: Get.width,
              height: Get.height - 100,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(key: navbarKeys.first),

                     HomePage(),

                    const SizedBox(height: 50),
                    // ABOUT
                    Container(
                      key: navbarKeys[1],
                      width: screenWidth,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      child: AboutPage(),
                    ),

                    // SKILLS
                    Container(
                      key: navbarKeys[2],
                      width: screenWidth,
                      height: 500,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      // color: CustomColor.bgLight1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // title
                          const Text(
                            "What I can do",
                            style: TextStyle(
                              fontSize: AppFonts.aboutFDesk,
                              fontWeight: FontWeight.bold,
                              // color: CustomColor.whitePrimary,
                            ),
                          ),
                          SkillsPage(),
                        ],
                      ),
                    ),

                    // const SizedBox(height: 50),
                    // Container(
                    //   key: navbarKeys[3],
                    //   width: screenWidth,
                    //   padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    //   height: 500,
                    //   color: Colors.blue,
                    //   child: Text('Projects'),
                    // ),
                    const SizedBox(height: 50),
                    Container(
                      key: navbarKeys[4],
                      width: screenWidth,
                      // padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      // height: 500,
                      // color: Colors.red,
                      child: Center(child: Text("Made by ${AboutUtils.myFName} With ❤️ Flutter 3.22.3")),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    // if (navIndex == 5) {
    //   // open a blog page
    //   // js.context.callMethod('open', [SnsLinks.blog]);
    //   return;
    // }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

}

// class ResponsiveDesignThirdWay extends GetResponsiveView<PortfolioController> {
//   ResponsiveDesignThirdWay()
//       : super(
//       settings: ResponsiveScreenSettings(
//         desktopChangePoint: 800,
//         tabletChangePoint: 700,
//         watchChangePoint: 600,
//       ));
//
//   @override
//   Widget builder() => Column(
//     children: [
//       // Text('Width>=800 Then Desktop', style: TextStyle(fontSize: 35)),
//       // SizedBox(
//       //   height: 8,
//       // ),
//       // Text('Width>=700 Then Tablet', style: TextStyle(fontSize: 35)),
//       // SizedBox(
//       //   height: 8,
//       // ),
//       // Text('Width<=600 Then Watch', style: TextStyle(fontSize: 35)),
//       // SizedBox(
//       //   height: 8,
//       // ),
//       // Text('Width>600 and Width<700 Then Mobile',
//       //     style: TextStyle(fontSize: 35)),
//       // SizedBox(
//       //   height: 8,
//       // ),
//       // SizedBox(
//       //   height: 8,
//       // ),
//       Text("Screen Type :${screen.screenType.toString()}",
//           style: TextStyle(fontSize: 35)),
//       SizedBox(
//         height: 8,
//       ),
//       Text("Screen Width :${screen.width.toString()}",
//           style: TextStyle(fontSize: 35)),
//     ],
//   );
// }
