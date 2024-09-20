import 'package:flutter/material.dart';
import 'location_data.dart'; // Ensure your location data is present
import 'package:tripquest/RestaurantDetailScreen.dart';

class VitaRoundScreen extends StatefulWidget {
  static const routeName = '/vita-round';

  @override
  _VitaRoundScreenState createState() => _VitaRoundScreenState();
}

class _VitaRoundScreenState extends State<VitaRoundScreen> with TickerProviderStateMixin {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.8);
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _autoScroll();
  }

  void _autoScroll() {
    _animationController.repeat(reverse: false);
    _animationController.addListener(() {
      int nextPage = _currentPage + 1;
      if (nextPage >= LocationData.hotLocations.length) {
        nextPage = 0;
      }
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage = nextPage;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Around VIT'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildBackground(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100), // Space for AppBar and content
                // Hot Locations Carousel
                _buildCarousel(),
                SizedBox(height: 20),
                // Categories
                _buildCategorySection('Restaurants', LocationData.restaurants),
                SizedBox(height: 20),
                _buildCategorySection('Fun Spots', LocationData.funSpots),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blueAccent.shade100, Colors.indigo.shade900],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: LocationData.hotLocations.length,
        itemBuilder: (context, index) {
          return _buildHotLocationCard(LocationData.hotLocations[index]);
        },
      ),
    );
  }

  Widget _buildHotLocationCard(Map<String, String> location) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        return Transform.scale(
          scale: _currentPage == LocationData.hotLocations.indexOf(location) ? 1.0 : 0.9,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(location['image']!), // Image from assets
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                location['name']!,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black54,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategorySection(String title, List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RestaurantDetailScreen.routeName,
                    arguments: {
                      'name': items[index]['name']!,
                      'image': items[index]['image']!,
                      'description': items[index]['description']!,
                    },
                  );
                },
                child: _buildCard(items[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCard(Map<String, String> item) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(item['image']!), // Image from assets
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.black54,
          padding: EdgeInsets.all(8.0),
          child: Text(
            item['name']!,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
