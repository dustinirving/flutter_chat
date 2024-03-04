import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: Text('Login Page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go('/home');
          },
          child: Icon(Icons.arrow_forward),
        ));
  }
}
