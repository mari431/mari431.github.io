import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/CertificateController.dart';
import '../widgets/CertificateCard.dart';

class CertificateView extends GetView<CertificateController> {

   CertificateView({super.key});

  final CertificateController controller =
  Get.put(CertificateController());

  @override
  Widget build(BuildContext context) {

    // Get.lazyPut(()=>CertificateController());


    return Container(
      height: 500,
      width: 500,
      // padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Obx(() {

          return GridView.builder(

            itemCount: controller.certificates.length,

            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(

              maxCrossAxisExtent: 350,

              mainAxisSpacing: 20,

              crossAxisSpacing: 20,

              childAspectRatio: .72,
            ),

            itemBuilder: (_, index) {

              return CertificateCard(
                certificate: controller.certificates[index],
              );

            },
          );
        }),
      ),
    );
  }
}