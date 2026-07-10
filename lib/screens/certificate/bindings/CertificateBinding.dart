import 'package:get/get.dart';

import '../../../controllers/CertificateController.dart';

class CertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CertificateController());
  }
}