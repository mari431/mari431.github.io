import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/appfonts.dart';
import 'package:marimuthu_portfolio/constants/h_Nav_Item.dart';
import 'package:marimuthu_portfolio/controllers/DownloadController.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/utils/common_utils.dart';
import 'package:marimuthu_portfolio/widgets/ThemeToggleButton.dart';
import 'package:marimuthu_portfolio/widgets/custom_widget/OpenToWorkWidget.dart';
import 'package:marimuthu_portfolio/widgets/logo/logo.dart';




class HeaderDesktop extends StatelessWidget {
  HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;

  final ThemeController _themeFindController = Get.find<ThemeController>();
  final DownloadController downloadController = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 55.0,
      // margin: const EdgeInsets.symmetric(
      //   vertical: 10.0,
      //   horizontal: 20.0,
      // ),
      width: double.maxFinite,
      // color: Colors.white,
      decoration: BoxDecoration(
        // color: Colors.transparent,
          color: AppColors.navBarConBgColor(_themeFindController.isDarkMode.value),
          boxShadow: [
            BoxShadow(
              color: AppColors.navBarConBoxShadowColor(_themeFindController.isDarkMode.value),
              // color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
              spreadRadius: 2, // How far the shadow spreads
              blurRadius: 7, // Blur radius (how soft the shadow is)
              offset: Offset(0, 4), // Position of the shadow (X, Y)
            ),
      ]),
      // decoration: kHederDecoration,
      child: Row(
        children: [
          Row(
            children: [
              // Logo_wdget(
              //   onTap: () {
              //     onNavMenuTap(0);
              //   },),
              SizedBox(width: 20,),
              OpenToWorkAnimation(),
              // Text('Open to work')
            ],
          ),
          // ClipOval(
          //   child: Image.asset(AboutUtils.logo_white,fit: BoxFit.fill),
          // ),
          // SiteLogo(
          //   onTap: () {},
          // ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Container(
              // width: 70,
              child: Padding(
                padding:  EdgeInsets.only(right: 2),
                child: TextButton(
                  onPressed: () {
                    onNavMenuTap(i);
                  },
                  child: Text(
                    navTitles[i],
                    style:  TextStyle(
                      fontSize: AppFonts.navBarText,
                      fontWeight: FontWeight.w500,
                      color:  AppColors.navBarTitleTextColor(_themeFindController.isDarkMode.value),
                    ),
                  ),
                ),
              ),
            ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueGrey,  // Text and icon color
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),  // Padding
              ),
              onPressed: (){
                onNavMenuTap(6);
              }, child: Text('Get in Touch',style: TextStyle(fontSize: 12),)),

          Center(
            child: Obx(() {
              return downloadController.isDownloading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton.icon(
                onHover: (value) {

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,  // Text and icon color
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),  // Padding
                ),
                icon: Icon(Icons.download),  // The icon
                label: Text('Resume',style: TextStyle(fontSize: 12)),     // The text
                onPressed: () {
                  downloadController.downloadAssetsFile(
                    'assets/Marimuthu_Kannayiram_Flutter_developer.pdf',  // Path to your asset PDF file
                    'Marimuthu_Kannayiram_Flutter_developer.pdf',         // Name of the file to save
                  );
                },
              );

              // IconButton(icon: Icon(Icons.download,),
              //   onPressed: () {
              //     downloadController.downloadAssetsFile(
              //       'assets/marimuthuKannayiram.pdf',
              //       'marimuthuKannayiram.pdf',
              //     );
              //   },
              // );
            }),
          ),



          ThemeToggleButton(),
        ],
      ),
    );
  }
}