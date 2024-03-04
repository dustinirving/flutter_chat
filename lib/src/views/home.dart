import 'package:flutter/material.dart';
import 'package:flutter_chat/src/components/navigation/bottom_navigation.dart';
import 'package:flutter_chat/src/components/tabs/friends.dart';
import 'package:flutter_chat/src/components/tabs/messages.dart';
import 'package:flutter_chat/src/components/navigation/side_navigation.dart';
import 'package:flutter_chat/src/components/tabs/profile.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  void updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget getTab() {
    switch (selectedIndex) {
      case 0:
        return Profile();
      case 1:
        return Friends();
      case 2:
        return Messages();
      default:
        return Profile();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        body: Row(
          children: [
            if (!isMobile)
              SafeArea(
                child: SideNavigation(
                    selectedIndex: selectedIndex, onIndexSelected: updateIndex),
              ),
            Expanded(
              child: getTab(),
            ),
          ],
        ),
        bottomNavigationBar: isMobile
            ? BottomNavigation(
                selectedIndex: selectedIndex, onIndexSelected: updateIndex)
            : null,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go('/');
          },
          child: Icon(Icons.add),
        ));
  }
}
