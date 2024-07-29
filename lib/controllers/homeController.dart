

import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get to => Get.put(HomeController());

  var _isProfileIconHovered = false.obs;

  get isProfileIconHovered => _isProfileIconHovered.value;

  set isProfileIconHovered(value) {
    _isProfileIconHovered.value = value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void updateProfileIconHoverState(bool isHovered) {

      isProfileIconHovered = isHovered.obs ;

  }


}