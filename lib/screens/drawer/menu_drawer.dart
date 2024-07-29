import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/MenuNController.dart';


class MenuDrawer extends StatelessWidget {
  final MenuNController _menuController = Get.put(MenuNController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              _menuController.setSelectedIndex(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              _menuController.setSelectedIndex(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              _menuController.setSelectedIndex(2);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
