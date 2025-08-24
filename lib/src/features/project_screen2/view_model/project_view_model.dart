import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';
import '../../../core/utils/sync/sync_service.dart';

import '../../service/hive_service.dart';
import '../model/project_model.dart';

class ProjectViewModel extends GetxController {
  var projects = <Project>[].obs;

  final hiveService = HiveService();
  final syncService = SyncService();

  @override
  void onInit() {
    projects.assignAll(hiveService.getAllProjects());
    hiveService.box.listenable().addListener(() {
      projects.assignAll(hiveService.getAllProjects());
    });
    syncService.syncProjects();
    super.onInit();
  }

  void addProject(String name, String description, DateTime endDate) {
    final project = Project(
      id: const Uuid().v4(),
      name: name,
      description: description,
      endDate: endDate,
    );
    hiveService.addProject(project);
    syncService.syncProjects();
  }

  void editProject(Project project, String name, String description, DateTime endDate) {
    final updated = Project(
      id: project.id,
      name: name,
      description: description,
      endDate: endDate,
    );
    hiveService.updateProject(updated);
    syncService.syncProjects();
  }
}
