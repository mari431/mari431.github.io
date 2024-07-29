import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/screens/ContactPage.dart';
import 'package:marimuthu_portfolio/screens/HomePage.dart';
import 'package:marimuthu_portfolio/screens/aboutPage.dart';
import 'package:marimuthu_portfolio/screens/projectsPage.dart';

import 'package:marimuthu_portfolio/widgets/ThemeToggleButton.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int selectedScreenIndex=0;

  int selectedScreen=0;

  List<Widget> screens=[];

  @override
  void initState() {
    setState(() {
      screens=[
        Homepage(),
        AboutPage(),
        ProjectsPage(),
        ContactPage(),
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // shadowColor: Colors.grey.shade50,
        // bottomOpacity:100,
        // elevation: 0.5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: Image(
                      image: AssetImage(
                          'images/tomjerry_logo.png')),
                ),
                // Image.asset('assets/images/tomjerry_logo.png'),
                Text('Marimuthu Portfolio',),
              ],
            ),
            bottomNavigation(),
            ThemeToggleButton(),
          ],
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                  child:
                  screens.isEmpty?Center(child: CircularProgressIndicator(color: Colors.grey,)):
                  screens[selectedScreen]
              ),
            ),
            // Center(
            //   child: Positioned(
            //     top: 0,
            //     bottom: 0,
            //     left: 0,
            //     right: 0,
            //     child: Container(
            //         margin: EdgeInsets.only(top: 15),
            //         child:
            //         screens.isEmpty?Center(child: CircularProgressIndicator(color: Colors.grey,)):
            //         screens[selectedScreen]
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }


  Widget bottomNavigation() {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          // color: Colors.black,
          color: Colors.transparent,
        ),
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  selectedScreen=0;
                  // ObservationController.to.selectIndex=0;
                });
              },
              child: bottomNavigationItem(
                  title: "Home".tr,
                  index: 0,
                  // icon: Icons.send
              ),
            ),

            InkWell(
                onTap: (){
                  setState(() {
                    selectedScreen=1;
                    // ObservationController.to.selectIndex=1;
                  });
                },
                child: bottomNavigationItem(
                    title: "About".tr,
                    index: 1,
                    // icon: Icons.person
                )
            ),
            InkWell(
                onTap: (){
                  setState(() {
                    selectedScreen=2;
                    // ObservationController.to.selectIndex=1;
                  });
                },
                child: bottomNavigationItem(
                  title: "Projects".tr,
                  index: 2,
                  // icon: Icons.person
                )
            ),
            InkWell(
                onTap: (){
                  setState(() {
                    selectedScreen=3;
                    // ObservationController.to.selectIndex=1;
                  });
                },
                child: bottomNavigationItem(
                  title: "Contact".tr,
                  index: 3,
                  // icon: Icons.person
                )
            ),
          ],
        ),
      ),
    );
  }

  Container bottomNavigationItem({required int index, required String title,
    // required IconData icon,
  }) {
    return Container(
      width: 70,
      color: selectedScreen==index? Colors.lightGreenAccent:Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(
          //   icon,
          //   color:selectedScreen==index? Colors.white:Colors.grey,),
          // SizedBox(height: 2,),
          Text("$title",
            style: TextStyle(
                fontSize: 10,
                color:selectedScreen==index? Colors.black:Colors.grey,
                fontWeight: FontWeight.bold
            ),)
        ],
      ),
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
