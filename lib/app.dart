import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/src/features/auth2/presentation/bloc/auth_bloc.dart';
import 'package:task_management/src/features/auth2/presentation/view/login_screen.dart';

import 'injector.dart';

class TaskManagement extends StatelessWidget {
  const TaskManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<AuthBloc>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Task Management",
        // initialRoute: isLogin ? '/project_screen' : '/login_screen',
        home: LoginScreen(),
      ),
    );
  }
}
