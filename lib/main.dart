import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Import your login screen
import 'screens/dashboard_screen.dart'; // Import your dashboard screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Planner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => LoginScreen(), // Login screen as the initial route
        '/dashboard': (context) => DashboardScreen(), // Dashboard screen
      },
    );
  }
}
