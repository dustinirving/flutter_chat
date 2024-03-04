import 'package:flutter_chat/src/components/pages/home.dart';
import 'package:flutter_chat/src/components/pages/login.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final routes = GoRouter(
  routes: [
    ShellRoute(
        builder: (context, state, child) {
          // Top level nav goes here.
          return child;
        },
        routes: [
          GoRoute(
            name: 'home',
            path: '/home',
            builder: (context, state) => HomePage(),
          ),
          GoRoute(
            name: 'login',
            path: '/',
            builder: (context, state) => LoginPage(),
          ),
        ])
  ],
);
