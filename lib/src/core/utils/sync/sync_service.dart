import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../features/service/firebase_service.dart';
import '../../../features/service/hive_service.dart';

class SyncService {
  final hiveService = HiveService();
  final firebaseService = FirebaseService();

  Future<void> syncProjects() async {
    var connectivity = await Connectivity().checkConnectivity();
    if (connectivity != ConnectivityResult.none) {
      // Upload local to Firebase
      for (var project in hiveService.getAllProjects()) {
        await firebaseService.uploadProject(project);
      }

      // Download Firebase to Hive
      var firebaseProjects = await firebaseService.downloadProjects();
      for (var project in firebaseProjects) {
        await hiveService.addProject(project);
      }
    }
  }
}
