import 'package:get/get.dart';
import 'package:marimuthu_portfolio/utils/project_utils.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  // static VideoController get to => Get.put(VideoController());
  // late VideoController videoPlayerController;
  // var isPlaying = false.obs;

  final List<SampleWorkdUtils> videoList;
  VideoController(this.videoList);

  var _isLoadingV = false.obs;

  get isLoadingV => _isLoadingV.value;

  set isLoadingV(value) {
    _isLoadingV.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    initializeVideos22();
    // Replace with your network video URL
    //   final String videoLink ='https://github-production-user-asset-6210df.s3.amazonaws.com/51232711/362587374-e9983bec-9d79-455d-9b95-4710b8d4ba07.mp4?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLSA53PQK4ZA%2F20240829%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20240829T091848Z&X-Amz-Expires=300&X-Amz-Signature=609e81f4a91a53f8d8d78a7df6ac4e0a125a92e4b54fbb8ff96c0dbe74ea29aa&X-Amz-SignedHeaders=host&actor_id=51232711&key_id=0&repo_id=849225011';
    //   final Uri videoLinkUri = Uri.parse(videoLink);
    // videoPlayerController = VideoPlayerController.networkUrl(videoLinkUri)
    //   ..initialize().then((_) {
    //     update(); // Notify listeners that the video is ready
    //   });


    // videoPlayerController = VideoPlayerController.asset('assets/videos/amountIn_words_OP.mp4')
    //   ..initialize().then((_) {
    //     isLoadingV = false;
    //     update(); // Notify listeners that the video is ready
    //   });


  }



  Future<void> initializeVideos22() async {
    isLoadingV = true;
    // await initializeVideos();
    // for (var item in sampleWorkUtils) {
    //   await item.initializeController();
    // }
    isLoadingV = false;
  }

  void playVideo(int index) {
    for (int i = 0; i < videoList.length; i++) {
      if (i == index) {
        if (!videoList[i].videoPlayerController.value.isPlaying) {
          videoList[i].videoPlayerController.play();
        }else{
          videoList[i].videoPlayerController.pause();
        }
      } else {
        videoList[i].videoPlayerController.pause();
      }
    }
    update(); // Update the UI
  }

  bool isPlaying(int index) {
    return videoList[index].videoPlayerController.value.isPlaying;
  }

  // void playPauseVideo() {
  //   if (videoPlayerController.value.isPlaying) {
  //     videoPlayerController.pause();
  //     isPlaying(false);
  //   } else {
  //     videoPlayerController.play();
  //     isPlaying(true);
  //   }
  // }

  @override
  void onClose() {
    // videoPlayerController.dispose();
    super.onClose();
  }
}
