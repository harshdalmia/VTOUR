import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tripquest/SearchScreen/search_screen.dart'; // Import the search screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Header without back button
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white.withOpacity(0.9),
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Spacer(), // Removed back button
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Navigate to search screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 80.0),
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                // Reviews carousel (centered, larger)
                Text('User Reviews', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0, // Larger height for bigger review size
                    autoPlay: true, // Auto play for carousel
                    enlargeCenterPage: true, // Enlarges the center review
                  ),
                  items: _buildReviews().map((review) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review['text']?.toString() ?? '',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  review['author']?.toString() ?? '',
                                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                // Popular Destinations
                Text('Popular Destinations', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildDestinationCard('Pondicherry', 'French colonial charm', 'lib/image/hello.jpg'),
                      SizedBox(width: 16),
                      _buildDestinationCard('Ooty', 'Queen of hill stations', 'lib/image/hello.jpg'),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Upcoming Trips
                Text('Upcoming Trips', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildUpcomingTrip('Weekend Getaway to Pondicherry', 'July 15-17, 2023'),
                        SizedBox(height: 8),
                        _buildUpcomingTrip('Day Trip to Yelagiri Hills', 'July 23, 2023'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Review data for the carousel
  List<Map<String, String>> _buildReviews() {
    return [
      {
        'text': "I absolutely love Vitian Util! It made planning my weekend trip to Pondicherry so easy. The personalized itinerary feature is a game-changer!",
        'author': "Alice S.",
      },
      {
        'text': "Vitian Util helped me find the best spots in Ooty. A must-have app for every traveler!",
        'author': "John D.",
      },
      {
        'text': "Thanks to Vitian Util, I discovered hidden gems in Pondicherry that I wouldn't have found otherwise!",
        'author': "Emily R.",
      },
    ];
  }

  // Reusable UI for destination cards
  Widget _buildDestinationCard(String title, String subtitle, String imageUrl) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Image.asset(imageUrl, width: 200, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(subtitle, style: TextStyle(color: Colors.blueGrey)),
          ),
        ],
      ),
    );
  }

  // Reusable UI for upcoming trip tiles
  Widget _buildUpcomingTrip(String title, String date) {
    return ListTile(
      leading: Icon(Icons.calendar_today),
      title: Text(title),
      subtitle: Text(date),
    );
  }
}