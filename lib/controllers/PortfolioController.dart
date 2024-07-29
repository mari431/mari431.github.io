import 'package:get/get.dart';
import 'package:marimuthu_portfolio/models/project.dart';


class PortfolioController extends GetxController {
  var projects = <Project>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProjects();
  }

  void fetchProjects() {
    // Dummy data
    var projectResult = [
      Project(title: 'Project 1', description: 'Description 1', imageUrl: 'https://via.placeholder.com/150'),
      Project(title: 'Project 2', description: 'Description 2', imageUrl: 'https://via.placeholder.com/150'),
      Project(title: 'Project 3', description: 'Description 3', imageUrl: 'https://via.placeholder.com/150'),
    ];

    projects.assignAll(projectResult);
  }
}
