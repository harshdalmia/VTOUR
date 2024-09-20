import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Travel Plans')),
      body: Center(
        child: Text('Travel Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
