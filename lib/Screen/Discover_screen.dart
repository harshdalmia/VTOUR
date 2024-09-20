import 'package:flutter/material.dart';

class Discoverscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Discover')),
      body: Center(
        child: Text('Discover Screen', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
