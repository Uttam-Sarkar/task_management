// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:task_management/dummy_screen.dart';
// import 'package:task_management/todo_list.dart';
//
// import 'bottom_nav_bar.dart';
// import 'src/features/drawer/view/drawer.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String title = "NAME";
//
//   @override
//   void initState() {
//     getName();
//     super.initState();
//   }
//
//   Future<void> getName() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     var savedName = prefs.getString("name") ?? "NAME";
//     setState(() {
//       title = savedName;
//     });
//   }
//
//   final List<Widget> pages = [
//     TodoList(),
//     DummyScreen(),
//     DummyScreen(),
//   ];
//  int pageIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.amberAccent,
//       ),
//       drawer: AppDrawer(),
//       body: pages[pageIndex],
//       bottomNavigationBar: BottomNavBar(
//         onTabChanged: (index) {
//           setState(() {
//             pageIndex = index;
//
//           });
//           print("User selected tab: $index");
//           // You can use this index in any logic or state
//         },
//       ),
//     );
//   }
// }
