

import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/video_playerController.dart';

import '../utils/project_utils.dart';

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

    final VideoController _videoController =
    Get.put(VideoController(sampleWorkUtils));
    _videoController.onInit();
    super.onInit();
  }

  void updateProfileIconHoverState(bool isHovered) {

      isProfileIconHovered = isHovered.obs ;

  }


}