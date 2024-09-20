import 'package:flutter/material.dart';
import 'navigation_home_screen.dart';  // Import the main navigation screen
import 'package:tripquest/VitaRoundScreen.dart';  // Import VitaRoundScreen
import 'RestaurantDetailScreen.dart';  // Import RestaurantDetailScreen

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
      initialRoute: '/',  // This sets the initial route to the home screen
      routes: {
        '/': (context) => NavigationHomeScreen(),  // Main screen with navigation
        VitaRoundScreen.routeName: (context) => VitaRoundScreen(),  // VitaRound screen route
        RestaurantDetailScreen.routeName: (context) => RestaurantDetailScreen(),  // Restaurant Detail screen route
      },
    );
  }
}
