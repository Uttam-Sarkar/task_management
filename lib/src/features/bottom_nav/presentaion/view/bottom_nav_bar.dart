import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int)? onTabChanged;

  const BottomNavBar({super.key, this.onTabChanged});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
        if (widget.onTabChanged != null) {
          widget.onTabChanged!(index); // send value to parent
        }
      },
      backgroundColor: Colors.white,
      // Background color
      selectedItemColor: Colors.blue,
      // Selected icon color
      unselectedItemColor: Colors.grey,
      // Unselected icon color
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        _buildNavItem(Icons.home_outlined, "Dashboard", 0),
        _buildNavItem(Icons.perm_identity, "Profile", 1),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String name, int index) {
    return BottomNavigationBarItem(icon: Icon(icon), label: name);
  }
}
