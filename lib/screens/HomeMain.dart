import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/controllers/UrlController.dart';
import 'package:marimuthu_portfolio/screens/ContactPage.dart';
import 'package:marimuthu_portfolio/screens/HomePage.dart';
import 'package:marimuthu_portfolio/screens/aboutPage.dart';
import 'package:marimuthu_portfolio/screens/get_In_touch.dart';
import 'package:marimuthu_portfolio/screens/skillsPage.dart';
import 'package:marimuthu_portfolio/screens/videoPlay/VideoPlayerScreen.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';

import 'dart:js' as js;

import 'package:marimuthu_portfolio/widgets/drawer_mobile.dart';
import 'package:marimuthu_portfolio/widgets/footer.dart';
import 'package:marimuthu_portfolio/widgets/header_desktop.dart';
import 'package:marimuthu_portfolio/widgets/header_mobile.dart';
import 'package:marimuthu_portfolio/widgets/logo/logo.dart';
import 'package:marimuthu_portfolio/widgets/projects_section.dart';
import 'package:marimuthu_portfolio/widgets/sample_work_widget/sample_work_section.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(7, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,

        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(onNavItemTap: (int navIndex) {
                scaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: Column(
          children: [
            /// NAVBAR
            if (constraints.maxWidth >= kMinDesktopNavbarWidth)
              HeaderDesktop(onNavMenuTap: (int navIndex) {
                scrollToSection(navIndex);
              })
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),
            Container(
              width: Get.width,
              height: Get.height - 70,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(key: navbarKeys.first),
                    /// Home
                    HomePage(),
                    const SizedBox(height: 5),
                    /// ABOUT
                    Container(
                      key: navbarKeys[1],
                      width: screenWidth,
                      child: AboutPage(),
                    ),
                    const SizedBox(height: 5),

                    /// SKILLS
                    Container(
                      key: navbarKeys[2],
                      width: screenWidth,
                      child: Center(child: SkillsPage()),
                    ),
                    const SizedBox(height: 5),

                    /// Work PROJECTS
                      Container(
                        key: navbarKeys[3],
                        width: screenWidth,
                        child: ProjectsSection(
                        ),
                      ),
                    const SizedBox(height: 30),
                    Container(
                      key: navbarKeys[4],
                      width: screenWidth,
                      child: SampleWorkSection(),),
                    const SizedBox(height: 30),

                    // GetInTouchWithMePage(
                    //   key: navbarKeys[6],
                    // ),
                    Container(
                      key: navbarKeys[6],
                      width: screenWidth,
                      child: GetInTouchWithMePage(
                        // key: navbarKeys[6],
                      ),
                    ),
                    const SizedBox(height: 30),
                    // /// CONTACT
                    Container(
                      key: navbarKeys[5],
                      width: screenWidth,
                      child: ContactScreen(),
                    ),

                    const SizedBox(height: 50),
                    Footer(),
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
