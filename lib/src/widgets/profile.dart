import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            shape: CircleBorder(),
            child: Padding(
              padding: const EdgeInsets.all(60),
              child: Column(
                children: [
                  Icon(Icons.person, size: 150),
                  Text(
                    'Dustin Irving',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
