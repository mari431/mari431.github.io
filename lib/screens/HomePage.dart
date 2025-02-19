import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/constants/size.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/controllers/UrlController.dart';
import 'package:marimuthu_portfolio/controllers/homeController.dart';
import 'package:marimuthu_portfolio/screens/ShowcaseScreen.dart';
import 'package:marimuthu_portfolio/screens/aboutPage.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';
import 'package:marquee_list/marquee_list.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final ThemeController _themeFindController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
        color: AppColors.homeBgColor(_themeFindController.isDarkMode.value),
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
                      return buildHomeImageNPositionDesktop();
                    }
          
                    // else
                    return buildHomeImageNPositionMobile();
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

  Row buildHomeImageNPositionDesktop() {
    return Row(
      children: [
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
                child: Image.asset(AboutUtils.myImageStr,fit: BoxFit.fill),
              ),
            ),
          ),
        ),
        const SizedBox(width: 50),
        // email
        Expanded(
          child: Container(
            width: 500,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowcaseScreen(),
                // Text(
                //   "Hi,\nI'm ${AboutUtils.myFName} ${AboutUtils.myLName}\nA ${AboutUtils.aboutPosition}",
                //   style: TextStyle(
                //     // color: Colors.white,
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column buildHomeImageNPositionMobile() {
    return Column(
      children: [
        // name
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
                child: Image.asset(AboutUtils.myImageStr,fit: BoxFit.fill),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        // email
        Expanded(
          child: Column(
            children: [
              Text(
                "Hi,\nI'm ${AboutUtils.myFName} ${AboutUtils.myLName}\nA ${AboutUtils.aboutPosition}",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         child: Column(
//       children: [
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
//
//           children: [
//             Expanded(
//               flex: 12,
//               child: Container(
//                 width: 400,
//                 height: 400,
//                 child: Image.asset(AboutUtils.myImageStr),
//               ),
//             ),
//             Text('adlkjsf')
//           ],
//         ),
//
//
//         Row(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               flex: 12,
//               child: Center(
//                   child: Container(
//                     width: 415,
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                         // color: Colors.black54,
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     child: Center(
//                       child: Column(
//                         children: [
//                           Text(
//                             AboutUtils.myFName + ' ' + AboutUtils.myLName,
//                             style: TextStyle(
//                               // color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//
//                           SizedBox(
//                             width: 280,
//                             height: 25,
//                             child: MarqueeList(
//                               scrollDirection: Axis.horizontal,
//                               scrollDuration: Duration(seconds: 2),
//                               children: [
//                                 // Text('alfmaslfk;slgm')
//                                 for (int i = 0; i < AboutUtils.mySkilles.length; i++)
//                                   Row(
//                                     children: [
//                                       Text(AboutUtils.mySkilles[i]
//                                       ),
//                                       Text(','),
//                                       SizedBox(width: 10,)
//                                     ],
//                                   ),
//
//                               ],
//                             ),
//                           ),
//
//
//                         ],
//                       ),
//                     ),
//                   )),
//             ),
//           ],
//         ),
//
//         // Row(
//         //   children: [
//         //     Container(
//         //       height: 100,
//         //       width: Get.width,
//         //       child: ListView.builder(
//         //         scrollDirection: Axis.horizontal,
//         //         itemCount: AboutUtils.profileicons.length,
//         //         itemBuilder: (context, index) {
//         //           final map = AboutUtils.profileicons[index];
//         //           return Row(
//         //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //             children: [
//         //               InkWell(
//         //                 onTap: (){
//         //                   UrlController.to.openUrl(index);
//         //                 },
//         //                 child: Container(
//         //                   width: 120,
//         //                   height: 30,
//         //                   padding: EdgeInsets.all(5),
//         //                   decoration: BoxDecoration(
//         //                       color: index == 0
//         //                           ? Colors.lightGreen
//         //                           : index == 1
//         //                               ? Colors.orange
//         //                               : Colors.blue,
//         //                       borderRadius: BorderRadius.circular(32),
//         //                       boxShadow: [
//         //                         BoxShadow(
//         //                             color: Colors.grey.withOpacity(0.1),
//         //                             spreadRadius: 1,
//         //                             blurRadius: 1,
//         //                             offset: Offset(0, 0))
//         //                       ]),
//         //                   child: Center(
//         //                       child: Row(
//         //                     children: [
//         //                       Image.asset(map),
//         //                       Text(index == 0
//         //                           ? 'Github'
//         //                           : index == 1
//         //                               ? 'Instagram'
//         //                               : 'LinkedIn')
//         //                     ],
//         //                   )),
//         //                 ),
//         //               ),
//         //               SizedBox(
//         //                 width: 10,
//         //               )
//         //             ],
//         //           );
//         //           // return ListTile(
//         //           //   title: Text(map),
//         //           // );
//         //         },
//         //       ),
//         //     ),
//         //   ],
//         // ),
//
//         // SizedBox(
//         //   width: 280,
//         //   height: 25,
//         //   child: MarqueeList(
//         //     scrollDirection: Axis.horizontal,
//         //     scrollDuration: Duration(seconds: 2),
//         //     children: [
//         //       // Text('alfmaslfk;slgm')
//         //       for (int i = 0; i < AboutUtils.mySkilles.length; i++)
//         //         Row(
//         //           children: [
//         //             Text(AboutUtils.mySkilles[i]
//         //             ),
//         //             Text(','),
//         //             SizedBox(width: 10,)
//         //           ],
//         //         ),
//         //
//         //     ],
//         //   ),
//         // ),
//         // AboutPage(),
//       ],
//     ));
//   }
// }
