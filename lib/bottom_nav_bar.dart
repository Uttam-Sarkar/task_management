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
      } ,
      backgroundColor: Colors.yellow, // Background color
      // selectedItemColor: AppColor.navigationColor, // Selected icon color
      unselectedItemColor: Colors.green, // Unselected icon color
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _buildNavItem(Icons.task, 0),
        _buildNavItem(Icons.all_inbox_sharp, 1),
        _buildNavItem(Icons.perm_identity_rounded, 2),
      ],

    );
  }
  BottomNavigationBarItem _buildNavItem(IconData icon, int index) {
    bool isSelected = selectedIndex == index;
    return BottomNavigationBarItem(
      icon: isSelected? Container(

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amberAccent,
        ),
        child: Icon(
          icon,
          size: 40, // Make selected item bigger
          color: Colors.red, // Change color
        ),
      ): Icon(icon),
      label: '',
    );
  }
}

