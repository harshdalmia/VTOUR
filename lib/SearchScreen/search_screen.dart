import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Start typing here...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Removed the "Top Services" section
            SizedBox(height: 20),
            Text(
              "Recent Searches",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RecentSearches(),
            SizedBox(height: 20),
            Text(
              "What's India Searching For",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            PopularSearches(),
          ],
        ),
      ),
    );
  }
}

class RecentSearches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Chennai to New Delhi flights for 26th October'),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('New Delhi to Chennai flights for 2nd November'),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Culture in Coorg'),
        ),
      ],
    );
  }
}

class PopularSearches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.trending_up),
          title: Text('Flights from Delhi to Goa'),
        ),
        ListTile(
          leading: Icon(Icons.trending_up),
          title: Text('Flights from Delhi to Dubai'),
        ),
        ListTile(
          leading: Icon(Icons.trending_up),
          title: Text('Flights from Delhi to Mumbai'),
        ),
      ],
    );
  }
}
