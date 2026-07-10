import 'package:get/get.dart';
import '../models/certificate_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificateController extends GetxController {

  final certificates = <CertificateModel>[

    CertificateModel(
      title: "Flutter For Beginners",
      issuer: "Great Learning",
      image: "assets/certificates/Marimuthu_Kannayiram20250620_Flutter_Beginner_cert.jpg",
      date: "This Certificate does not expire",
      verifyUrl: "https://www.mygreatlearning.com/certificate/MMRHRWRP",
    ),


    CertificateModel(
      title: "Generative AI Overview for Project Managers",
      issuer: "Project Management Institute",
      image: "assets/certificates/genAI_Overview_for_projectManagers.jpg",
      date: "This Certificate does not expire",
      verifyUrl: "https://learning.pmi.org/certificate?id=cfa372e2-930d-4cc8-8aa9-16eb79c1edb3",
    ),

    CertificateModel(
      title: "AI Express: Artificial Intelligence Essentials in Minutes!",
      issuer: "IBM",
      image: "assets/certificates/AI_IBMessentialinminutes.jpg",
      date: "This Certificate does not expire",
      verifyUrl: "https://skills.yourlearning.ibm.com/certificate/share/cd9cc1f172ewogICJsZWFybmVyQ05VTSIgOiAiNDg1MTUyN1JFRyIsCiAgIm9iamVjdFR5cGUiIDogIkFDVElWSVRZIiwKICAib2JqZWN0SWQiIDogIlBMQU4tRTdFRDJBQUNCNjkyIgp910ca995952-10",
    ),

    CertificateModel(
      title: "Tech touchdown: How AI is enhancing American football's game experience.",
      issuer: "IBM",
      image: "assets/certificates/AI_IBM_amercan_football.jpg",
      date: "This Certificate does not expire",
      verifyUrl: "https://skills.yourlearning.ibm.com/certificate/share/cb6456aac5ewogICJsZWFybmVyQ05VTSIgOiAiNDg1MTUyN1JFRyIsCiAgIm9iamVjdFR5cGUiIDogIkFDVElWSVRZIiwKICAib2JqZWN0SWQiIDogIk1ETC0zOTMiCn0fb00dafc5e-10",
    ),



  ].obs;


  Future<void> openCertificate(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

}