import 'package:flutter/material.dart';
import 'package:taskmaster/screens/home_screen.dart';
import 'package:taskmaster/screens/login_screen.dart';
import 'package:taskmaster/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: routes,
    );
  }
}

final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignUpScreen(),
  '/home':(context) => const HomeScreen(),
};
