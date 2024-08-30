// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:marimuthu_portfolio/controllers/video_playerController.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoPlayerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final VideoController videoController = Get.put(VideoController());
//
//     return Obx(() {
//       if (videoController.isLoadingV == true) {
//         return Center(child: CircularProgressIndicator());
//       } else {
//         return Container(
//           color: Colors.green,
//           // height: 600,
//           // width: 300,
//           child: Column(
//             children: [
//
//               Container(
//                 height: 350,
//                 width: 300,
//                 child: AspectRatio(
//                   aspectRatio: videoController.videoPlayerController.value.aspectRatio,
//                   child: Container(
//                     width: 400,
//                       child: VideoPlayer(videoController.videoPlayerController)),
//                 ),
//               ),
//               // SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: videoController.playPauseVideo,
//                 child: Text(videoController.isPlaying.value ? 'Pause' : 'Play'),
//               ),
//             ],
//           ),
//         );
//       }
//     });
//   }
// }
