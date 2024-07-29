import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/controllers/homeController.dart';
import 'package:marimuthu_portfolio/screens/aboutPage.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    width: 400,
                    height: 400,
                    child: Image.asset(AboutUtils.myImageStr),
                  ),
                  Positioned(
                    bottom: 30,
                    // top: 10,
                    // left: 200,
                    child: Container(
                      width: 415,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              AboutUtils.myFName + ' ' + AboutUtils.myLName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              AboutUtils.aboutPosition,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 12,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Me,',
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                  Container(
                      width: 400,
                      child: Text(
                        AboutUtils.aboutMeDetail2,
                      )),
                ],
              )),
            ),
          ],
        ),

        Row(
          children: [
            Container(
              height: 100,
              width: Get.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: AboutUtils.profileicons.length,
                itemBuilder: (context, index) {
                  final map = AboutUtils.profileicons[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 120,
                        height: 30,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: index == 0
                                ? Colors.lightGreen
                                : index == 1
                                    ? Colors.orange
                                    : Colors.blue,
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 0))
                            ]),
                        child: Center(
                            child: Row(
                          children: [
                            Image.asset(map),
                            Text(index == 0
                                ? 'Github'
                                : index == 1
                                    ? 'Instagram'
                                    : 'LinkedIn')
                          ],
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  );
                  // return ListTile(
                  //   title: Text(map),
                  // );
                },
              ),
            ),
          ],
        ),
        // AboutPage(),
      ],
    ));
  }
}
