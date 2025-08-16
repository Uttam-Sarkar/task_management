import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';import 'app.dart';
import 'injector.dart';
import 'src/features/project_screen/model/project_model.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initialize();

  await Hive.initFlutter();
  Hive.registerAdapter(ProjectAdapter()); // ✅ Register the generated adapter
  await Hive.openBox<Project>('projects');

  // runApp(const TaskManagement());
  runApp(const TaskManagement());
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Task Management",
//       // initialRoute: isLogin ? '/project_screen' : '/login_screen',
//       home: SignUpScreen(),
//     );
//     // return AppRoutes.appRoutes();
//     // return SafeArea(
//     //   child: GetMaterialApp(
//     //     debugShowCheckedModeBanner: false,
//     //     title: 'Flutter Demo',
//     //     initialRoute: isLogin ? '/project_screen' : '/login_screen',
//     //     getPages:AppRoutes.appRoutes(),
//     //   ),
//     // );
//   }
// }
