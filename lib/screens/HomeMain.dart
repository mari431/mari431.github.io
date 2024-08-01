import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/controllers/UrlController.dart';
import 'package:marimuthu_portfolio/screens/HomePage.dart';
import 'package:marimuthu_portfolio/screens/aboutPage.dart';
import 'package:marimuthu_portfolio/screens/get_In_touch.dart';
import 'package:marimuthu_portfolio/screens/skillsPage.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';

import 'dart:js' as js;

import 'package:marimuthu_portfolio/widgets/drawer_mobile.dart';
import 'package:marimuthu_portfolio/widgets/footer.dart';
import 'package:marimuthu_portfolio/widgets/header_desktop.dart';
import 'package:marimuthu_portfolio/widgets/header_mobile.dart';
import 'package:marimuthu_portfolio/widgets/projects_section.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(6, (index) => GlobalKey());

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
            /// NAVBAR
            if (constraints.maxWidth >= kMinDesktopWidth)
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
              height: Get.height - 80,
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

              //       for (int i = 0; i < withMeProjectUtils.length; i++)
              //       WithMeCardWidget(
              //   project: withMeProjectUtils[i],
              // ),

                    GetInTouchWithMePage(
                      key: navbarKeys[5],
                    ),


         //        Row(
         //   children: [
         //     Container(
         //       height: 100,
         //       width: Get.width,
         //       child: ListView.builder(
         //         scrollDirection: Axis.horizontal,
         //         itemCount: AboutUtils.profileicons.length,
         //         itemBuilder: (context, index) {
         //           final map = AboutUtils.profileicons[index];
         //           return Row(
         //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         //             children: [
         //               InkWell(
         //                 onTap: (){
         //                   UrlController.to.openUrl(index);
         //                 },
         //                 child: Container(
         //                   width: 120,
         //                   height: 30,
         //                   padding: EdgeInsets.all(5),
         //                   decoration: BoxDecoration(
         //                       color: index == 0
         //                           ? Colors.lightGreen
         //                           : index == 1
         //                               ? Colors.orange
         //                               : Colors.blue,
         //                       borderRadius: BorderRadius.circular(32),
         //                       boxShadow: [
         //                         BoxShadow(
         //                             color: Colors.grey.withOpacity(0.1),
         //                             spreadRadius: 1,
         //                             blurRadius: 1,
         //                             offset: Offset(0, 0))
         //                       ]),
         //                   child: Center(
         //                       child: Row(
         //                     children: [
         //                       Image.asset(map),
         //                       Text(index == 0
         //                           ? 'Github'
         //                           : index == 1
         //                               ? 'Instagram'
         //                               : 'LinkedIn')
         //                     ],
         //                   )),
         //                 ),
         //               ),
         //               SizedBox(
         //                 width: 10,
         //               )
         //             ],
         //           );
         //           // return ListTile(
         //           //   title: Text(map),
         //           // );
         //         },
         //       ),
         //     ),
         //   ],
         // ),


                    const SizedBox(height: 50),
                    // /// CONTACT
                    Container(
                      key: navbarKeys[4],
                      width: screenWidth,
                      // padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      // height: 500,
                      // color: Colors.red,
                      child: Center(child: Text("Contact")),
                    ),
                    // const SizedBox(height: 30),
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
