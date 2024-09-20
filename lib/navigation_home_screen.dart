import 'package:flutter/material.dart';
import 'Screen/home_screen.dart';
import 'Screen/Discover_screen.dart';
import 'Screen/Bookings_screen.dart';
import 'Screen/profile_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  int _selectedIndex = 0;

  // Define a list of widget screens for navigation
  final List<Widget> _screens = [
    HomeScreen(),
    Discoverscreen(),
    BookingsScreen(),
    ProfileScreen(),
  ];

  // Function to handle on-tap of bottom navigation items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens, // Show the selected screen without rebuilding others
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 8.0,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          selectedItemColor: Colors.amber[700],
          unselectedItemColor: Colors.white60,
          elevation: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, size: 30),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore, size: 30),
              label: 'MyTrip',
            ),
          ],
        ),
      ),
    );
  }
}
