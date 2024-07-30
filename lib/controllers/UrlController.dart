import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlController extends GetxController {
  static UrlController get to => Get.put(UrlController());
  final url = ''.obs;

  Future<void> setUrl(String newUrl)async {
    url.value = newUrl;
  }

  // void openUrl() async {
  //   if (await canLaunchUrl(url.value)) {
  //     await launchUrl(url.value, forceSafariVC: false, forceWebView: false);
  //   } else {
  //     Get.snackbar('Error', 'Could not launch the URL');
  //   }
  // }


void openUrl(index) async {
  final String deepLink= index == 0 ? 'https://github.com/mari431' : index == 1 ? 'https://www.instagram.com/marimuthu_flutterdev/' : index == 2 ? 'https://www.linkedin.com/in/marimuthu-k-2015it19/' : 'https://mari431.github.io/FileNotFound';


  // final String deepLink ='https://mari431.github.io/';
  // final String deepLink ='http://globetextiles.net/';
  final Uri deepLinkUri = Uri.parse(deepLink);
  // print('${deepLinkUri}'); // Convert String to Uri object
  if (await canLaunchUrl(deepLinkUri)) {
    await launchUrl(deepLinkUri);
  } else {
    // print('2');
    Get.snackbar('Error', 'Could not launch the URL');
  }
}



}
