import 'package:flutter/material.dart';

class SideNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexSelected;

  SideNavigation({required this.selectedIndex, required this.onIndexSelected});

  @override
  Widget build(BuildContext context) {
    // Returns an icon with the primary color if it's selected, otherwise outlined
    Widget getIcon(IconData selectedIcon, IconData outlinedIcon, int index) {
      final isSelected = selectedIndex == index;
      return Icon(
        isSelected ? selectedIcon : outlinedIcon,
        color: isSelected ? Colors.white : Colors.grey.shade500,
      );
    }

        // Custom label with conditional color
    Widget getLabel(String text, int index) {
      final isSelected = selectedIndex == index;
      return Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey.shade500, // Selected color : Unselected color
        ),
      );
    }

    return NavigationRail(
      extended: false,
      labelType: NavigationRailLabelType.all,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      destinations: [
        NavigationRailDestination(
          icon: getIcon(Icons.person, Icons.person_outline, 0),
          label: getLabel('Profile', 0),
          padding: EdgeInsets.all(15),
        ),
        NavigationRailDestination(
          icon: getIcon(Icons.people, Icons.people_outline, 1),
          label: getLabel('Friends', 1),
          padding: EdgeInsets.only(bottom: 15),
        ),
        NavigationRailDestination(
          icon: getIcon(Icons.message, Icons.message_outlined, 2),
          label: getLabel('Messages', 2),
          padding: EdgeInsets.only(bottom: 15),
        ),
      ],
      selectedIndex: selectedIndex,
      indicatorColor: Colors.transparent,
      onDestinationSelected: (value) {
        onIndexSelected(value);
      },
    );
  }
}
