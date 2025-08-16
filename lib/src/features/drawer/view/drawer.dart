// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task_management/src/core/utils/theme/theme.dart';
// import '../../auth/view_model/auth_view_model.dart';
//
// class AppDrawer extends StatelessWidget {
//   final AuthViewModel controller = Get.put(AuthViewModel());
//
//   AppDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Drawer(
//       child: ListView(
//         children: [
//           ListTile(
//             leading: const Icon(Icons.exit_to_app),
//             title: const Text("Log Out", style: TextStyle(color: redColor),),
//             onTap: () {
//               controller.logout();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
