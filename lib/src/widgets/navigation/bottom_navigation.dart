import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexSelected;

  BottomNavigation(
      {required this.selectedIndex, required this.onIndexSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
          activeIcon: Icon(Icons.person),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people_outline),
          label: 'Friends',
          activeIcon: Icon(Icons.people),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Messages',
            activeIcon: Icon(Icons.message)),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.shade500,
      onTap: onIndexSelected,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
    );
  }
}
