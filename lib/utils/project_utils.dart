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

/// WORK PROJECTS
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'images/playstore.png',
    title: 'GTIL-Ahmedabad',
    subtitle:
    'This is an English learning app for students to learn English through various methods.',
    androidLink:
    'https://play.google.com/store/apps/details?id=globetextiles.net&hl=en',
    // iosLink:
    // "https://apps.apple.com/kr/app/%EC%98%81%EC%96%B4%EB%A8%B8%EB%A6%AC-%EA%B3%B5%EC%9E%91%EC%86%8C/id1507102714",
  ),
  ProjectUtils(
    image: 'images/playstore.png',
    title: 'GTIL-Ahmedabad',
    subtitle:
    'This is an English learning app for students to learn English through various methods.',
    androidLink:
    'https://play.google.com/store/apps/details?id=globetextiles.net&hl=en',
    // iosLink:
    // "https://apps.apple.com/kr/app/%EC%98%81%EC%96%B4%EB%A8%B8%EB%A6%AC-%EA%B3%B5%EC%9E%91%EC%86%8C/id1507102714",
  ),
  // ProjectUtils(
  //   image: 'assets/projects/w02.png',
  //   title: 'Online Shop Web App',
  //   subtitle:
  //   'This is a responsive online shop web application for car engine oil.',
  //   webLink: 'https://www.elo.best',
  // ),
];