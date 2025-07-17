import 'package:flutter/material.dart';
import 'package:login_app_test/pages/login_page.dart';
import 'package:login_app_test/pages/register_page.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginPage': (context) => const LoginPage(),
        // 'RegisterPage': (context) => const RegisterPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
      },

      initialRoute: 'LoginPage',
    );
  }
}
