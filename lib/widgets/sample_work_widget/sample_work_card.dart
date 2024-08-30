import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      height: 405,
      width: 280,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Color(0xff424657),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0)
            )
          ]
      ),
      child: Column(
        children: [
          Text(samplework.title),
          Obx(() {
            if (videoController.isLoadingV == true) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                // color: Colors.green,
                // height: 600,
                // width: 300,
                child: Column(
                  children: [

                    Container(
                      height: 350,
                      width: 300,
                      child: AspectRatio(
                        aspectRatio: samplework.videoPlayerController.value.aspectRatio,
                        child: Container(
                            width: 400,
                            child: VideoPlayer(samplework.videoPlayerController)),
                      ),
                    ),
                    // SizedBox(height: 10),

                    // Container(
                    //     height: 10,
                    //     child: Obx(()=>Text('AAA'))),

                    // ElevatedButton(
                    //   // onPressed: videoController.playPauseVideo,
                    //   onPressed: () {
                    //     videoController.playVideo(index);
                    //     // if (samplework.videoPlayerController.value.isPlaying) {
                    //     //   samplework.videoPlayerController.pause();
                    //     // } else {
                    //     //   samplework.videoPlayerController.play();
                    //     // }
                    //   },
                    //   child:
                    //   Text(
                    //     videoController.isPlaying(index) ? 'Pause' : 'Play',
                    //   ),
                    //   // Text(samplework.videoPlayerController.value.isPlaying ? 'Pause' : 'Play'),
                    // ),
                  ],
                ),
              );
            }
          }),

          GetBuilder(
            init: VideoController(sampleWorkUtils),
            builder: (controller) {
            return ElevatedButton(
              // onPressed: videoController.playPauseVideo,
              onPressed: () {
                videoController.playVideo(index);
                // if (samplework.videoPlayerController.value.isPlaying) {
                //   samplework.videoPlayerController.pause();
                // } else {
                //   samplework.videoPlayerController.play();
                // }
              },
              child:
              Text(
                videoController.isPlaying(index) ? 'Pause' : 'Play',
              ),
              // Text(samplework.videoPlayerController.value.isPlaying ? 'Pause' : 'Play'),
            );
          },),

          // Obx(()=>Container(
          //     height: 10,
          //     width: 30,
          //     child: Text('AAA'))),


        ],
      ),
    );
  }
}