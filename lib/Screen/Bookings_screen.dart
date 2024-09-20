import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Booking')),
      body: Center(
        child: Text('Booking Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
