import 'package:flutter/material.dart';
import 'navigation_home_screen.dart'; // Main navigation screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VTour',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => NavigationHomeScreen(), // Navigate to home
        // Add other routes if needed
      },
    );
  }
}
