import 'package:flutter/material.dart';

import '../../../../core/utils/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Log Out", style: TextStyle(color: redColor),),
            onTap: () {
              // controller.logout();
            },
          ),
        ],
      ),
    );
  }
}
