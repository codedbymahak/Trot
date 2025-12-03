import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tort/intro_screens/recommended_page.dart';
import 'package:tort/intro_screens/travel_quiz.dart';

class TravelHomePage extends StatefulWidget {
  final String username;

  const TravelHomePage({super.key, required this.username});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  int _popularIndex = 0;
  late Timer _timer;

  final List<Map<String, String>> popularPlaces = [
    {'image': 'assets/images/paris.jpeg', 'name': 'Paris, France', 'rating': '4.8'},
    {'image': 'assets/images/tokyo.jpeg', 'name': 'Tokyo, Japan', 'rating': '4.7'},
    {'image': 'assets/images/newyork.jpeg', 'name': 'New York, USA', 'rating': '4.6'},
    {'image': 'assets/images/istanbul.jpeg', 'name': 'Istanbul, Turkey', 'rating': '4.5'},
    {'image': 'assets/images/zermatt.jpeg', 'name': 'Zermatt, Switzerland', 'rating': '4.9'},
    {'image': 'assets/images/dubai.jpeg', 'name': 'Dubai, UAE', 'rating': '4.4'},
  ];

  final List<Map<String, String>> recommendedPlaces = [
    {'image': 'assets/images/paris.jpeg', 'name': 'Paris'},
    {'image': 'assets/images/tokyo.jpeg', 'name': 'Tokyo'},
    {'image': 'assets/images/istanbul.jpeg', 'name': 'Istanbul'},
    {'image': 'assets/images/cairo.jpeg', 'name': 'Cairo'},
    {'image': 'assets/images/harbin.jpeg', 'name': 'Harbin'},
    {'image': 'assets/images/newyork.jpeg', 'name': 'New York'},
    {'image': 'assets/images/bali.jpeg', 'name': 'Bali'},
    {'image': 'assets/images/hawaii.jpeg', 'name': 'Hawaii'},
    {'image': 'assets/images/barcelona.jpeg', 'name': 'Barcelona'},
    {'image': 'assets/images/dubai.jpeg', 'name': 'Dubai'},
    {'image': 'assets/images/zermatt.jpeg', 'name': 'Zermatt'},
    {'image': 'assets/images/reykjavik.jpeg', 'name': 'Reykjavik'},
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _popularIndex = (_popularIndex + 1) % popularPlaces.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _navigateToRecommended() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void _onMoodBoxTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TravelQuizApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                "Hi,",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                widget.username,
                style: const TextStyle(fontSize: 26, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              const Text(
                "Popular",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.orange[300],
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(popularPlaces[_popularIndex]['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.black54,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popularPlaces[_popularIndex]['name']!,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow[600], size: 16),
                              const SizedBox(width: 4),
                              Text(
                                popularPlaces[_popularIndex]['rating']!,
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recommended",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: _navigateToRecommended,
                    child: const Text(
                      "See all",
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedPlaces.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 120,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: Colors.orange[300],
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(recommendedPlaces[index]['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          color: Colors.black54,
                          child: Text(
                            recommendedPlaces[index]['name']!,
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _onMoodBoxTapped,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8DB0AD),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: const Text(
                    "Discover places based on your mood and style!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Georgia',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}