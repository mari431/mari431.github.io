import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marimuthu_portfolio/constants/appcolors.dart';
import 'package:marimuthu_portfolio/controllers/ThemeController.dart';
import 'package:marimuthu_portfolio/controllers/video_playerController.dart';


import 'package:marimuthu_portfolio/utils/project_utils.dart';
import 'package:video_player/video_player.dart';

class SampleWorkCardWidget extends StatelessWidget {
  SampleWorkCardWidget({
    super.key,
    required this.samplework,
    required this.index
  });
  final SampleWorkdUtils samplework;
  final int index;

  final ThemeController _themeFindController = Get.find<ThemeController>();
  final VideoController videoController = Get.put(VideoController(sampleWorkUtils));

  @override
  Widget build(BuildContext context) {
    // final VideoController = Get.put(VideoController(sampleWorkUtils));
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 355,
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.5)),
          // color: Color(0xff424657),
          color:AppColors.wProjectBgColor(_themeFindController.isDarkMode.value),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0)
            )
          ]
      ),
      child: Container(
        height: 305,
        // width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(samplework.title),
            Obx(() {
              if (videoController.isLoadingV == true) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  height: 300,
                  width: 240,
                  child: AspectRatio(
                    aspectRatio: samplework.videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(samplework.videoPlayerController),
                  ),
                );
              }
            }),
            SizedBox(height: 1),

            GetBuilder(
              init: VideoController(sampleWorkUtils),
              builder: (controller) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
                ),
                onPressed: () {
                  videoController.playVideo(index);
                },
                child:
                Text(
                  videoController.isPlaying(index) ? 'Pause' : 'Play',
                  style: TextStyle(color: Colors.white),
                ),
                // Text(samplework.videoPlayerController.value.isPlaying ? 'Pause' : 'Play'),
              );
            },),


          ],
        ),
      ),
    );
  }
}