import 'package:video_player/video_player.dart';

/// WORK PROJECTS start
class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/images/playstore.png',
    title: 'GTIL-Ahmedabad',
    subtitle:
    'Exceling in sourcing, manufacturing, and trading diverse innovative and sustainable textile products.(https://globetextiles.net/)',
    androidLink:
    'https://play.google.com/store/apps/details?id=globetextiles.net&hl=en',
    // iosLink:
    // "https://apps.apple.com/kr/app/%EC%98%81%EC%96%B4%EB%A8%B8%EB%A6%AC-%EA%B3%B5%EC%9E%91%EC%86%8C/id1507102714",
    webLink: "https://mari431.github.io/",
  ),
  ProjectUtils(
    image: 'assets/images/dowhisle_logo_web.png',
    title: 'DoWhistle',
    subtitle:
    'Static Website for DoWhistle company.'
        ' (Dev Team member)',
    webLink: "https://www.dowhistle.com/",
  ),
  // ProjectUtils(
  //   image: 'images/playstore.png',
  //   title: 'GTIL-Ahmedabad',
  //   subtitle:
  //   'Exceling in sourcing, manufacturing, and trading diverse innovative and sustainable textile products.',
  //   androidLink:
  //   'https://play.google.com/store/apps/details?id=globetextiles.net&hl=en',
  //   // iosLink:
  //   // "https://apps.apple.com/kr/app/%EC%98%81%EC%96%B4%EB%A8%B8%EB%A6%AC-%EA%B3%B5%EC%9E%91%EC%86%8C/id1507102714",
  // ),
  // ProjectUtils(
  //   image: 'assets/projects/w02.png',
  //   title: 'Online Shop Web App',
  //   subtitle:
  //   'This is a responsive online shop web application for car engine oil.',
  //   webLink: 'https://www.elo.best',
  // ),
];
/// WORK PROJECTS end


/// WORK SAMPLE  start
class SampleWorkdUtils {
  final String video;
  final String title;
  final String subtitle;
  final VideoPlayerController videoPlayerController;

  SampleWorkdUtils({
    required this.video,
    required this.title,
    required this.subtitle,
  }) : videoPlayerController = VideoPlayerController.asset(video){
    _initializeAndListen();
  }

  void _initializeAndListen() {
    videoPlayerController.initialize().then((_) {
      videoPlayerController.addListener(() {
        if (videoPlayerController.value.position == videoPlayerController.value.duration) {
          // Video has reached the end
          videoPlayerController.pause();
          videoPlayerController.seekTo(Duration.zero); // Optional: reset to the beginning
        }
      });
    });
  }

  // Future<void> initializeController() async {
  //   await videoPlayerController.initialize();
  // }

}

List<SampleWorkdUtils> sampleWorkUtils = [
  SampleWorkdUtils(
    video: 'assets/videos/signin_signup_OP.mp4',
    title: 'SignIn SignUp',
    subtitle:
    '',
    // videoPlayerController: VideoPlayerController.asset('assets/videos/amountIn_words_OP1.mp4'),

  ),
  SampleWorkdUtils(
    video: 'assets/videos/amountIn_words_OP.mp4',
    title: 'Amount in Words',
    subtitle:
    '',
    // videoPlayerController: VideoPlayerController.asset('assets/videos/amountIn_words_OP2.mp4'),
  ),
  SampleWorkdUtils(
    video: 'assets/videos/3d_animation_flutter.mp4',
    title: '3D Animation View',
    subtitle:
    '',
    // videoPlayerController: VideoPlayerController.asset('assets/videos/amountIn_words_OP2.mp4'),
  ),
  SampleWorkdUtils(
    video: 'assets/videos/Image_animation_flutter.mp4',
    title: 'Slider Animation',
    subtitle:
    '',
    // videoPlayerController: VideoPlayerController.asset('assets/videos/amountIn_words_OP2.mp4'),
  ),
  SampleWorkdUtils(
    video: 'assets/videos/shopping_cart_Image_OP.mp4',
    title: 'Shopping Cart Image',
    subtitle:
    '',
    // videoPlayerController: VideoPlayerController.asset('assets/videos/amountIn_words_OP2.mp4'),
  ),
  SampleWorkdUtils(
    video: 'assets/videos/share_receipt_image_OP.webm',
    title: 'Share Receipt Image',
    subtitle:
    '',
    // videoPlayerController: VideoPlayerController.asset('assets/videos/amountIn_words_OP2.mp4'),
  ),
];

// Future<void> initializeVideos() async {
//   for (var item in sampleWorkUtils) {
//     await item.initializeController();
//   }
// }

// void _initializeAndListen() {
//   videoPlayerController.initialize().then((_) {
//     videoPlayerController.addListener(() {
//       if (videoPlayerController.value.position == videoPlayerController.value.duration) {
//         // Video has reached the end
//         videoPlayerController.pause();
//         videoPlayerController.seekTo(Duration.zero); // Optional: reset to the beginning
//       }
//     });
//   });
// }

/// WORK PROJECTS end