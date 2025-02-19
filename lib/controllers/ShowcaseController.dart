import 'package:get/get.dart';

class ShowcaseController extends GetxController {
  var isVisible = false.obs;
  var scrollOffset = 0.0.obs;

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 1), () {
      isVisible.value = true;
    });
    super.onInit();
  }

  void onScroll(double offset) {
    if (offset > scrollOffset.value) {
      isVisible.value = false; // Hide on scroll down
    } else {
      isVisible.value = true; // Show on scroll up
    }
    scrollOffset.value = offset;
  }

}