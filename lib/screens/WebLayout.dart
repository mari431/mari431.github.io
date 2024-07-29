import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/MenuNController.dart';

class WebLayout extends StatelessWidget {
  final MenuNController _menuController = Get.find<MenuNController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
    //     Obx(()
    // {
    //   return NavigationRail(
    //     selectedIndex: _menuController.selectedIndex.value,
    //     onDestinationSelected: (index) {
    //       _menuController.setSelectedIndex(index);
    //     },
    //     // backgroundColor: Colors.cyan,
    //     labelType: NavigationRailLabelType.all,
    //     destinations: [
    //       NavigationRailDestination(
    //         icon: Icon(Icons.home),
    //         label: Text('Home'),
    //       ),
    //       NavigationRailDestination(
    //         icon: Icon(Icons.person),
    //         label: Text('Profile'),
    //       ),
    //       NavigationRailDestination(
    //         icon: Icon(Icons.settings),
    //         label: Text('Settings'),
    //       ),
    //     ],
    //   );
    // }),
        Expanded(
          child: Center(
            child: Obx(() {
              switch (_menuController.selectedIndex.value) {
                case 0:
                  return Text('Home Page - Web');
                case 1:
                  return Text('Profile Page - Web');
                case 2:
                  return Text('Settings Page - Web');
                default:
                  return Text('Home Page - Web');
              }
            }),
          ),
        ),
      ],
    );
  }
}
