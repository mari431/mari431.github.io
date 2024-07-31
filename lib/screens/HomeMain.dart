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
                              fontSize: AppFonts.caption,
                              fontWeight: FontWeight.bold,
                              // color: CustomColor.whitePrimary,
                            ),
                          ),
                          SkillsPage(),
                        ],
                      ),
                    ),


                    const SizedBox(height: 50),
                    Container(
                      key: navbarKeys[3],
                      width: screenWidth,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      height: 500,
                      color: Colors.blue,
                      child: Text('Projects'),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      key: navbarKeys[4],
                      width: screenWidth,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      // height: 500,
                      color: Colors.red,
                      child: Text('Contact'),
                    ),




                    // SKILLS
                    // Container(
                    //   key: navbarKeys[1],
                    //   width: screenWidth,
                    //   padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                    //   color: CustomColor.bgLight1,
                    //   child: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       // title
                    //       const Text(
                    //         "What I can do",
                    //         style: TextStyle(
                    //           fontSize: 24,
                    //           fontWeight: FontWeight.bold,
                    //           // color: CustomColor.whitePrimary,
                    //         ),
                    //       ),
                    //       const SizedBox(height: 50),
                    //
                    //       // platforms and skills
                    //       if (constraints.maxWidth >= kMedDesktopWidth)
                    //         const SkillsDesktop()
                    //       else
                    //         const SkillsMobile(),
                    //     ],
                    //
                    //   ),
                    // ),
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
    // if (navIndex == 4) {
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



// class HomeMain extends StatefulWidget {
//   const HomeMain({super.key});
//
//   @override
//   State<HomeMain> createState() => _HomeMainState();
// }
//
// class _HomeMainState extends State<HomeMain> {
//   int selectedScreenIndex=0;
//
//   int selectedScreen=0;
//
//   List<Widget> screens=[];
//
//   @override
//   void initState() {
//     setState(() {
//       screens=[
//         Homepage(),
//         AboutPage(),
//         ProjectsPage(),
//         ContactPage(),
//       ];
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         // shadowColor: Colors.grey.shade50,
//         // bottomOpacity:100,
//         // elevation: 0.5,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 SizedBox(
//                   width: 70,
//                   height: 70,
//                   child: Image.asset(AboutUtils.logoStr),
//                   // child: Image(
//                   //     image: AssetImage(
//                   //         'images/tomjerry_logo.png')),
//                 ),
//                 // Image.asset('assets/images/tomjerry_logo.png'),
//                 Text('Marimuthu Portfolio',),
//               ],
//             ),
//             bottomNavigation(),
//             ThemeToggleButton(),
//           ],
//         ),
//       ),
//       body: Container(
//         width: Get.width,
//         height: Get.height,
//         child: Stack(
//           children: [
//             Center(
//               child: Container(
//                 margin: EdgeInsets.only(top: 15),
//                   child:
//                   screens.isEmpty?Center(child: CircularProgressIndicator(color: Colors.grey,)):
//                   screens[selectedScreen]
//               ),
//             ),
//             // Center(
//             //   child: Positioned(
//             //     top: 0,
//             //     bottom: 0,
//             //     left: 0,
//             //     right: 0,
//             //     child: Container(
//             //         margin: EdgeInsets.only(top: 15),
//             //         child:
//             //         screens.isEmpty?Center(child: CircularProgressIndicator(color: Colors.grey,)):
//             //         screens[selectedScreen]
//             //     ),
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Widget bottomNavigation() {
//     return Material(
//       color: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//           // color: Colors.black,
//           color: Colors.transparent,
//         ),
//         height: 30,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             InkWell(
//               onTap: (){
//                 setState(() {
//                   selectedScreen=0;
//                   // ObservationController.to.selectIndex=0;
//                 });
//               },
//               child: bottomNavigationItem(
//                   title: "Home".tr,
//                   index: 0,
//                   // icon: Icons.send
//               ),
//             ),
//
//             InkWell(
//                 onTap: (){
//                   setState(() {
//                     selectedScreen=1;
//                     // ObservationController.to.selectIndex=1;
//                   });
//                 },
//                 child: bottomNavigationItem(
//                     title: "About".tr,
//                     index: 1,
//                     // icon: Icons.person
//                 )
//             ),
//             InkWell(
//                 onTap: (){
//                   setState(() {
//                     selectedScreen=2;
//                     // ObservationController.to.selectIndex=1;
//                   });
//                 },
//                 child: bottomNavigationItem(
//                   title: "Projects".tr,
//                   index: 2,
//                   // icon: Icons.person
//                 )
//             ),
//             InkWell(
//                 onTap: (){
//                   setState(() {
//                     selectedScreen=3;
//                     // ObservationController.to.selectIndex=1;
//                   });
//                 },
//                 child: bottomNavigationItem(
//                   title: "Contact".tr,
//                   index: 3,
//                   // icon: Icons.person
//                 )
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Container bottomNavigationItem({required int index, required String title,
//     // required IconData icon,
//   }) {
//     return Container(
//       width: 70,
//       color: selectedScreen==index? Colors.lightGreenAccent:Colors.transparent,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Icon(
//           //   icon,
//           //   color:selectedScreen==index? Colors.white:Colors.grey,),
//           // SizedBox(height: 2,),
//           Text("$title",
//             style: TextStyle(
//                 fontSize: 10,
//                 color:selectedScreen==index? Colors.black:Colors.grey,
//                 fontWeight: FontWeight.bold
//             ),)
//         ],
//       ),
//     );
//   }
//
//
//
//
//
// }





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
