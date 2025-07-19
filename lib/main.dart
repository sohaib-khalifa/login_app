import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_app_test/firebase_options.dart';
import 'package:login_app_test/pages/home_page.dart';
import 'package:login_app_test/pages/login_page.dart';
import 'package:login_app_test/pages/main_screen.dart';
import 'package:login_app_test/pages/register_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        RegisterPage.routeName: (context) => RegisterPage(),
        MainScreen.routeName: (context) => MainScreen(),
        HomePage.routeName: (context) => HomePage(),
      },
      initialRoute: 'LoginPage',
    );
  }
}
