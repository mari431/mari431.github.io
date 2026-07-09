import 'package:flutter/material.dart';

class AboutUtils {
  static const String myFName =
      'Marimuthu';

  static const String myLName =
      'Kannayiram';

  static const String aboutPosition =
      'Flutter - Full Stack Developer.';

  // static const String aboutMeDetail2 =
  //     'I\'m done B.Tech IT, I have a solid foundation in information technology, coupled with hands-on experience in various programming languages and software development tools. During my academic journey, I have developed a keen interest in web development, mobile development, which I have pursued through personal projects.';

  static const String aboutMeDetail2 = 'I\'m Marimuthu, a Full Stack Developer with 6.7 years of experience building cross-platform applications and the systems behind them. I specialize in Flutter — building apps that run on Android, iOS, Web, and Desktop from a single codebase — paired with Node.js, Firebase, and MSSQL Server on the backend.I care about the full picture of an app, not just the UI: how data is structured in the database, how APIs move that data reliably, and how the release pipeline gets it into users\' hands without friction. That end-to-end view comes from years of working across the stack — designing databases and stored procedures, building REST APIs with Node.js/Express, integrating Firebase for real-time features, and automating releases with CI/CD.When I\'m not building, I\'m usually refining how these pieces fit together — cleaner architecture, faster release cycles, fewer moving parts to break.Currently building at Globe Enterprises (India) Ltd. Based in Ahmedabad, Gujarat.';

  static const String myImageStr = 'images/my_image1.jpg';
  static const String myImage2Str = 'images/my_image22.jpg';

  static const String logo_white = 'images/mn_logo_white.png';
  static const String logo_black = 'images/mn_logo_black.png';

  static const String logo_bg_white = 'images/mn_logo_bg_white.png';
  static const String logo_bg_black = 'images/mn_logo_bg_black.png';

  static String navLogo(bool isDarkMode) {
    return isDarkMode ?  'images/mn_logo_white.png' : 'images/mn_logo_black.png';
  }

  static const  String logoStr = 'images/tomjerry_logo.png';

  static const List<String> profileLinks = [
    "https://github.com/mari431",
    "https://www.instagram.com/marimuthu_flutterdev/"
    "https://www.linkedin.com/in/marimuthu-k-2015it19/",
    "https://stackoverflow.com/users/19601808/marimuthu-k"
  ];

  static const List<String> profileicons = [
    "images/github_logo.png",
    "images/instagram_logo_black.png",
    "images/linkedin_logo_black.png"
  ];

  static const List<String> mySkilles = [
    "Flutter Developer",
    "Mobile App Development",
    "NodeJs",
    "MSSql",
    "Web App Development",
    "Meme Creator"
  ];


}


class ContactUtils {
  static const List<IconData> contactIcons = [
    Icons.home,
    Icons.phone,
    Icons.mail,
  ];

  static const List<String> contacttitles = [
    "Location",
    "Phone",
    "Email",
  ];

  static const List<String> contactdetails = [
    "Gujarat, India",
    "(+91) 8668005452",
    "marimuthu.k.it@gmail.com",
  ];
}