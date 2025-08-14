import 'package:get/get.dart';
import 'package:task_management/src/core/router/routes_name.dart';
import 'package:task_management/src/features/auth/view/login_screen.dart';
import 'package:task_management/src/features/auth/view/signup_screen.dart';
import 'package:task_management/src/features/project_screen/view/project_screen.dart';

import '../../../home_page.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RoutesName.homePage,
      page: () => HomePage(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RoutesName.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutesName.signupScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: RoutesName.projectScreen,
      page: () => ProjectScreen(),
    ),
  ];
}
