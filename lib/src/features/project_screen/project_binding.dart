import 'package:get/get.dart';
import 'package:task_management/src/features/project_screen/view_model/project_view_model.dart';

class ProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectViewModel>(() => ProjectViewModel());
  }
}
