import 'package:flutter/material.dart';

class SideNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexSelected;

  SideNavigation({required this.selectedIndex, required this.onIndexSelected});

  @override
  Widget build(BuildContext context) {
    // Capture the primary color in a variable for easier use
    final primaryColor = Theme.of(context).colorScheme.primary;

    // Returns an icon with the primary color if it's selected
    Icon getIcon(IconData iconData, int index) {
      return Icon(
        iconData,
        // Apply the primary color only if the icon is selected
        color: selectedIndex == index ? primaryColor : null,
      );
    }

    return NavigationRail(
      extended: false,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      destinations: [
        NavigationRailDestination(
          icon: getIcon(Icons.person, 0),
          label: Text('Profile'),
        ),
        NavigationRailDestination(
          icon: getIcon(Icons.people, 1),
          label: Text('Friends'),
        ),
        NavigationRailDestination(
          icon: getIcon(Icons.message, 2),
          label: Text('Messages'),
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        onIndexSelected(value);
      },
    );
  }
}
