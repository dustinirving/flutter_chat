import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  late Auth0 auth0;

  @override
  void initState() {
    super.initState();
    auth0 =
        Auth0(dotenv.env['AUTH_0_DOMAIN']!, dotenv.env['AUTH_0_CLIENT_ID_APP']!);

    _login();
  }

  // Separate asynchronous method to handle login
  Future<void> _login() async {
    try {
      final credentials = await auth0.webAuthentication().login();

      if (mounted) {
        // Check if the widget is still mounted
        context.go('/home', extra: credentials);
      }
    } catch (e) {
      print(e); // It's important to handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Center(
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
