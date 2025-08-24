import 'package:cloud_firestore/cloud_firestore.dart';
import '../project_screen2/model/project_model.dart';

class FirebaseService {
  final firestore = FirebaseFirestore.instance;

  Future<void> uploadProject(Project project) async {
    await firestore.collection('projects').doc(project.id).set(project.toMap());
  }

  Future<List<Project>> downloadProjects() async {
    var snapshot = await firestore.collection('projects').get();
    return snapshot.docs.map((doc) => Project.fromMap(doc.data())).toList();
  }
}
