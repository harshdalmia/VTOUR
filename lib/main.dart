import 'package:flutter/material.dart';
import 'navigation_home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Bar Example',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black87,
          selectedItemColor: Colors.amber[700],
          unselectedItemColor: Colors.white60,
        ),
      ),
      home: NavigationHomeScreen(), // Nav screen
    );
  }
}
