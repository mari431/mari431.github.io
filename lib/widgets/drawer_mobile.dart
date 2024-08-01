import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/constants/h_Nav_Item.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/widgets/ThemeToggleButton.dart';


class DrawerMobile extends StatelessWidget {
   DrawerMobile({
    super.key,
    required this.onNavItemTap,
  });
  final Function(int) onNavItemTap;

  final ThemeController _themeFindController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: CustomColor.scaffoldBg,
      // backgroundColor: Colors.white,
      child: ListView(
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
          ElevatedButton(
              onPressed: (){
                onNavItemTap(5);
              }, child: Text('Get in Touch')),
          ThemeToggleButton(),
        ],
      ),
    );
  }
}