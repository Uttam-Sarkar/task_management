import 'package:hive_flutter/hive_flutter.dart';
import '../project_screen/model/project_model.dart';

class HiveService {
  final Box<Project> box = Hive.box<Project>('projects');

  Future<void> addProject(Project project) async => await box.put(project.id, project);

  Future<void> updateProject(Project project) async => await box.put(project.id, project);

  List<Project> getAllProjects() => box.values.toList();
}
