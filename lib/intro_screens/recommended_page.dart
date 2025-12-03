import 'package:flutter/material.dart';
import 'package:tort/intro_screens/paris_page.dart';
import 'package:tort/intro_screens/tokyo_page.dart';
import 'package:tort/intro_screens/istanbul_page.dart';
import 'package:tort/intro_screens/cairo_page.dart';
import 'package:tort/intro_screens/harbin_page.dart';
import 'package:tort/intro_screens/newyork_page.dart';
import 'package:tort/intro_screens/bali_page.dart';
import 'package:tort/intro_screens/hawaii_page.dart';
import 'package:tort/intro_screens/barcelona_page.dart';
import 'package:tort/intro_screens/dubai_page.dart';
import 'package:tort/intro_screens/zermatt_page.dart';
import 'package:tort/intro_screens/reykjavik_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recommended',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
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

  final Map<String, WidgetBuilder> cityPages = {
    'Paris': (_) => ParisPage(),
    'Tokyo': (_) => TokyoPage(),
    'Istanbul': (_) => IstanbulPage(),
    'Cairo': (_) => CairoPage(),
    'Harbin': (_) => HarbinPage(),
    'New York': (_) => NewYorkPage(),
    'Bali': (_) => BaliPage(),
    'Hawaii': (_) => HawaiiPage(),
    'Barcelona': (_) => BarcelonaPage(),
    'Dubai': (_) => DubaiPage(),
    'Zermatt': (_) => ZermattPage(),
    'Reykjavik': (_) => ReykjavikPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: recommendedPlaces.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final place = recommendedPlaces[index];
            return DestinationCard(
              title: place['name']!,
              imagePath: place['image']!,
              onTap: () {
                final builder = cityPages[place['name']];
                if (builder != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: builder),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(title: place['name']!),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const DestinationCard({
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Welcome to $title!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
