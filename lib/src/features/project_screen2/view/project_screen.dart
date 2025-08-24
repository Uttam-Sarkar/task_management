// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task_management/src/features/project_screen2/view_model/project_view_model.dart';
// import '../model/project_model.dart';
//
// // GetView<ProjectViewModel>
// class ProjectScreen extends StatelessWidget {
//    ProjectScreen({super.key});
//   final ProjectViewModel controller = Get.put(ProjectViewModel());
//
//   void _showProjectDialog({Project? project}) {
//     String name = project?.name ?? '';
//     String description = project?.description ?? '';
//     DateTime endDate = project?.endDate ?? DateTime.now();
//
//     Get.dialog(
//       AlertDialog(
//         title: Text(project == null ? 'Add Project' : 'Edit Project'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               onChanged: (v) => name = v,
//               controller: TextEditingController(text: name),
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               onChanged: (v) => description = v,
//               controller: TextEditingController(text: description),
//               decoration: const InputDecoration(labelText: 'Description'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 DateTime? picked = await showDatePicker(
//                   context: Get.context!,
//                   initialDate: endDate,
//                   firstDate: DateTime(2020),
//                   lastDate: DateTime(2100),
//                 );
//                 if (picked != null) {
//                   endDate = picked;
//                 }
//               },
//               child: const Text("Pick End Date"),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               if (project == null) {
//                 // controller.addProject(name, description, endDate);
//               } else {
//                 // controller.editProject(project, name, description, endDate);
//               }
//               Get.back();
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Projects')),
//       body: Obx(() {
//         if (controller.projects.isEmpty) {
//           return const Center(child: Text('No projects yet'));
//         }
//         return ListView.builder(
//           itemCount: controller.projects.length,
//           itemBuilder: (_, index) {
//             final project = controller.projects[index];
//             return Card(
//               child: ListTile(
//                 title: Text(project.name),
//                 subtitle: Text(
//                   '${project.description}\nEnd: ${project.endDate.toLocal()}',
//                 ),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.edit),
//                   onPressed: () => _showProjectDialog(project: project),
//                 ),
//               ),
//             );
//           },
//         );
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _showProjectDialog(),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
