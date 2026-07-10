import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/controllers/CertificateController.dart';

import '../../../constants/appcolors.dart';
import '../../../controllers/ThemeController.dart';
import '../../../models/certificate_model.dart';


class CertificateCard extends StatelessWidget {

  final CertificateModel certificate;

   CertificateCard({
    super.key,
    required this.certificate,
  });

  final CertificateController _certificateController = Get.find<CertificateController>();
  final ThemeController _themeFindController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {

    return Card(
      // color: Colors.white,
      color:AppColors.wProjectBgColor(_themeFindController.isDarkMode.value),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                certificate.image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              certificate.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              certificate.issuer,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            Text(certificate.date),

            const Spacer(),

            // ElevatedButton.icon(
            //   onPressed: () {
            //     _certificateController.openCertificate(certificate.verifyUrl);
            //     // certificate.verifyUrl;
            //
            //   },
            //   icon: const Icon(Icons.open_in_new,color: Colors.yellow,),
            //   label: const Text("View Certificate",style: TextStyle(color: Colors.yellow),),
            // )

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromRadius(12.0),
                  backgroundColor: AppColors.playPauseBtnBGColor(_themeFindController.isDarkMode.value)
              ),
              onPressed: () {
                _certificateController.openCertificate(certificate.verifyUrl);
              },
              child:
              Text(
                '🔗 View Certificate',
                style: TextStyle(color: AppColors.playPauseBtnTextColor(_themeFindController.isDarkMode.value)),
              ),
            )



          ],
        ),
      ),
    );
  }
}