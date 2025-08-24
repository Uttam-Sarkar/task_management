import 'package:flutter/material.dart';
import 'package:task_management/src/features/profile_screen/presentaion/view/profile_screen.dart';

import '../../../bottom_nav/presentaion/view/bottom_nav_bar.dart';
import '../../../project_screen/presentaion/view/project_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String title = "Projects";
  //
  // @override
  // void initState() {
  //   getName();
  //   super.initState();
  // }

  // Future<void> getName() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var savedName = prefs.getString("name") ?? "NAME";
  //   setState(() {
  //     title = savedName;
  //   });
  // }

  final List<Widget> pages = [
    ProjectScreen(),
    // DummyScreen(),
    ProfileScreen(),
  ];
 int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      //   backgroundColor: Colors.amberAccent,
      // ),
      // drawer: AppDrawer(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavBar(
        onTabChanged: (index) {
          setState(() {
            pageIndex = index;

          });
          print("User selected tab: $index");
          // You can use this index in any logic or state
        },
      ),
    );
  }
}
