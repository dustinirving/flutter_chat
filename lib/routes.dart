import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/src/pages/login.dart';
import 'package:flutter_chat/src/pages/home.dart';
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
            path: '/home',
            builder: (BuildContext context, GoRouterState state) {
              // Extract credentials passed through extra
              final credentials = state.extra as Credentials?;
              return HomePage(credentials: credentials);
            },
          ),
          GoRoute(
            name: 'login',
            path: '/',
            builder: (context, state) => LoginPage(),
          ),
        ])
  ],
);
