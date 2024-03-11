import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/widgets/navigation/bottom_navigation.dart';
import 'package:flutter_chat/src/widgets/friends.dart';
import 'package:flutter_chat/src/widgets/messages.dart';
import 'package:flutter_chat/src/widgets/navigation/side_navigation.dart';
import 'package:flutter_chat/src/widgets/profile.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  final Credentials? credentials; // Add this line
  const HomePage({Key? key, this.credentials}) : super(key: key); // Modify this line

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
        return Profile(credentials: widget.credentials);
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
        body: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Row(
            children: [
              if (!isMobile)
                SafeArea(
                  child: SideNavigation(
                      selectedIndex: selectedIndex,
                      onIndexSelected: updateIndex),
                ),
              Expanded(
                child: getTab(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: isMobile
            ? BottomNavigation(
                selectedIndex: selectedIndex, onIndexSelected: updateIndex)
            : null);
  }
}
