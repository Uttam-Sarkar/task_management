import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/src/core/shared/cubits/app_user_cubit.dart';
import 'package:task_management/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task_management/src/features/auth/presentation/view/login_screen.dart';
import 'package:task_management/src/features/dashboard/presentaion/view/dashboard.dart';

// import 'package:task_management/src/features/dashboard/presentaion/view/dashboard.dart';
//
// import 'injector.dart';

class TaskManagement extends StatefulWidget {
  const TaskManagement({super.key});

  @override
  State<TaskManagement> createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
    print("AuthIsUserLoggedIn called: ");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Management",
      // initialRoute: isLogin ? '/project_screen2' : '/login_screen',
      home: BlocSelector<AppUserCubit, AuthUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return Dashboard();
            // return Scaffold(body: Center(child: Text("LOGIN")));
          }else{
            return LoginScreen();
          }

        },
      ),
    );
  }
}
