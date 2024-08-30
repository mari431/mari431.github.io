import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
// import 'package:dio/dio.dart';

class DownloadController extends GetxController {
  var isDownloading = false.obs;

  Future<void> downloadAssetsFile(String assetPath, String fileName) async {
    try {
      // print(assetPath);
      // print(fileName);
      isDownloading(true);

      if (kIsWeb) {
        // For Web, trigger the download in the browser
        final ByteData data = await rootBundle.load(assetPath);
        final List<int> bytes = data.buffer.asUint8List();
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute("download", fileName)
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        // Handle other platforms (e.g., mobile) as before
        // Implement the logic for mobile platforms here
        // Get the application directory
        final dir = await getApplicationDocumentsDirectory();
        // print(dir);
        String savePath = "${dir.path}/$fileName";

        // Load the PDF from assets
        ByteData data = await rootBundle.load(assetPath);
        List<int> bytes = data.buffer.asUint8List();

        // Write the file to the device
        File file = File(savePath);
        await file.writeAsBytes(bytes);
      }



      isDownloading(false);
      Get.snackbar("Success", "Resume downloaded successfully!");
    } catch (e) {
      isDownloading(false);
      Get.snackbar("Error", "Failed to download the file.");
    }
  }





/// downloadController.downloadFile(
/// 'https://your-server.com/path-to/resume.pdf',
/// 'resume.pdf',
/// );

  // Future<void> downloadFile(String url, String fileName) async {
  //   try {
  //     isDownloading(true);
  //
  //     // Get the application directory
  //     final dir = await getApplicationDocumentsDirectory();
  //     String savePath = "${dir.path}/$fileName";
  //
  //     // Download the file
  //     Dio dio = Dio();
  //     await dio.download(url, savePath);
  //
  //     isDownloading(false);
  //     Get.snackbar("Success", "File downloaded successfully!");
  //   } catch (e) {
  //     isDownloading(false);
  //     Get.snackbar("Error", "Failed to download the file.");
  //   }
  // }

}
