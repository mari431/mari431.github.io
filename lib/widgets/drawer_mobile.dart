import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/h_Nav_Item.dart';
import 'package:marimuthu_portfolio/controllers/DownloadController.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/widgets/ThemeToggleButton.dart';
import 'package:marimuthu_portfolio/widgets/logo/logo.dart';


class DrawerMobile extends StatelessWidget {
   DrawerMobile({
    super.key,
    required this.onNavItemTap,
  });
  final Function(int) onNavItemTap;

  final ThemeController _themeFindController = Get.find<ThemeController>();
   final DownloadController downloadController = Get.put(DownloadController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: CustomColor.scaffoldBg,
      // backgroundColor: Colors.white,
      child: ListView(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    bottom: 20,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                child: Logo_wdget(
                  onTap: () {
                    onNavItemTap(0);
                  },),
              ),
            ],
          ),

          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                // color: CustomColor.whitePrimary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              onTap: () {
                onNavItemTap(i);
              },
              leading: Icon(navIcons[i]),
              title: Text(navTitles[i],style: TextStyle(color:  AppColors.navBarTitleTextColor(_themeFindController.isDarkMode.value),),),
            ),
          // ElevatedButton(
          //     onPressed: (){
          //       onNavItemTap(5);
          //     }, child: Text('Get in Touch')),

          // ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       foregroundColor: Colors.white,
          //       backgroundColor: Colors.blueGrey,  // Text and icon color
          //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),  // Padding
          //     ),
          //     onPressed: (){
          //       onNavItemTap(6);
          //     }, child: Text('Get in Touch')),

          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueGrey,  // Text and icon color
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),  // Padding
              ),
              icon: Icon(Icons.touch_app),  // The icon
              label: Text('Get in Touch'),     // The text
              onPressed: () {
                onNavItemTap(6);
              },
            ),
          ),

          SizedBox(height: 5,),

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
                label: Text('Resume'),     // The text
                onPressed: () {
                  downloadController.downloadAssetsFile(
                    'assets/marimuthuKannayiram.pdf',  // Path to your asset PDF file
                    'marimuthuKannayiram.pdf',         // Name of the file to save
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

          SizedBox(height: 5,),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('DL Mode'),
                ThemeToggleButton(),
              ],
            ),
          ),

          SizedBox(height: 5,),
        ],
      ),
    );
  }
}