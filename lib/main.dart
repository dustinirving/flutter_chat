import 'package:flutter/material.dart';
import 'package:flutter_chat/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Namer App',
      // Light Theme
      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.grey.shade500,
      //     brightness: Brightness.light,
      //   ),
      // ),
      // Dark Theme
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors
                .blueGrey, // Choose a seed color appropriate for dark theme
            brightness: Brightness.dark,
            primary: Color(0xFF1d9bd1),
            primaryContainer: Color(0xFF0b1e2c),
            secondaryContainer: Color(0xFF012d49)),
      ),
      // Use the dark theme if the system is set to dark mode
      themeMode: ThemeMode.system,
      routerConfig: routes,
    );
  }
}
