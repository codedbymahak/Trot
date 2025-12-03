import 'package:flutter/material.dart';
import 'package:tort/intro_screens/travel_homepage.dart';
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

void main() => runApp(TravelQuizApp());

class TravelQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Quiz',
      home: TravelQuestionnairePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TravelQuestionnairePage extends StatefulWidget {
  @override
  _TravelQuestionnairePageState createState() =>
      _TravelQuestionnairePageState();
}

class _TravelQuestionnairePageState extends State<TravelQuestionnairePage> {
  int _backgroundIndex = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': "🌤 Choose the season you'd like to travel to.",
      'options': ['Winter', 'Spring', 'Summer', 'Autumn'],
    },
    {
      'question': '👫 Who would you like to travel with?',
      'options': ['Solo', 'Friends', 'Family', 'Partner'],
    },
    {
      'question': '💰 What’s your budget range?',
      'options': [
        'Under \$500',
        '\$500 - \$1000',
        '\$1000 - \$2000',
        'Above \$2000',
      ],
    },
  ];

  final Map<String, String> _destinationMap = {
    // ❄ WINTER
    'Winter|Solo|Under \$500': 'harbin',
    'Winter|Solo|\$500 - \$1000': 'istanbul',
    'Winter|Solo|\$1000 - \$2000': 'zermatt',
    'Winter|Solo|Above \$2000': 'reykjavik',

    'Winter|Friends|Under \$500': 'barcelona',
    'Winter|Friends|\$500 - \$1000': 'new york',
    'Winter|Friends|\$1000 - \$2000': 'zermatt',
    'Winter|Friends|Above \$2000': 'reykjavik',

    'Winter|Family|Under \$500': 'paris',
    'Winter|Family|\$500 - \$1000': 'dubai',
    'Winter|Family|\$1000 - \$2000': 'tokyo',
    'Winter|Family|Above \$2000': 'reykjavik',

    'Winter|Partner|Under \$500': 'harbin',
    'Winter|Partner|\$500 - \$1000': 'istanbul',
    'Winter|Partner|\$1000 - \$2000': 'zermatt',
    'Winter|Partner|Above \$2000': 'reykjavik',

    // 🌸 SPRING
    'Spring|Solo|Under \$500': 'paris',
    'Spring|Solo|\$500 - \$1000': 'tokyo',
    'Spring|Solo|\$1000 - \$2000': 'istanbul',
    'Spring|Solo|Above \$2000': 'cairo',

    'Spring|Friends|Under \$500': 'barcelona',
    'Spring|Friends|\$500 - \$1000': 'dubai',
    'Spring|Friends|\$1000 - \$2000': 'bali',
    'Spring|Friends|Above \$2000': 'hawaii',

    'Spring|Family|Under \$500': 'harbin',
    'Spring|Family|\$500 - \$1000': 'new york',
    'Spring|Family|\$1000 - \$2000': 'tokyo',
    'Spring|Family|Above \$2000': 'paris',

    'Spring|Partner|Under \$500': 'istanbul',
    'Spring|Partner|\$500 - \$1000': 'dubai',
    'Spring|Partner|\$1000 - \$2000': 'paris',
    'Spring|Partner|Above \$2000': 'hawaii',

    // ☀ SUMMER
    'Summer|Solo|Under \$500': 'barcelona',
    'Summer|Solo|\$500 - \$1000': 'new york',
    'Summer|Solo|\$1000 - \$2000': 'bali',
    'Summer|Solo|Above \$2000': 'hawaii',

    'Summer|Friends|Under \$500': 'paris',
    'Summer|Friends|\$500 - \$1000': 'tokyo',
    'Summer|Friends|\$1000 - \$2000': 'dubai',
    'Summer|Friends|Above \$2000': 'hawaii',

    'Summer|Family|Under \$500': 'harbin',
    'Summer|Family|\$500 - \$1000': 'dubai',
    'Summer|Family|\$1000 - \$2000': 'tokyo',
    'Summer|Family|Above \$2000': 'hawaii',

    'Summer|Partner|Under \$500': 'barcelona',
    'Summer|Partner|\$500 - \$1000': 'istanbul',
    'Summer|Partner|\$1000 - \$2000': 'bali',
    'Summer|Partner|Above \$2000': 'hawaii',

    // 🏝 TROPICAL (was Autumn)
    'Tropical|Solo|Under \$500': 'bali',
    'Tropical|Solo|\$500 - \$1000': 'dubai',
    'Tropical|Solo|\$1000 - \$2000': 'hawaii',
    'Tropical|Solo|Above \$2000': 'cairo',

    'Tropical|Friends|Under \$500': 'harbin',
    'Tropical|Friends|\$500 - \$1000': 'new york',
    'Tropical|Friends|\$1000 - \$2000': 'bali',
    'Tropical|Friends|Above \$2000': 'hawaii',

    'Tropical|Family|Under \$500': 'barcelona',
    'Tropical|Family|\$500 - \$1000': 'dubai',
    'Tropical|Family|\$1000 - \$2000': 'tokyo',
    'Tropical|Family|Above \$2000': 'hawaii',

    'Tropical|Partner|Under \$500': 'paris',
    'Tropical|Partner|\$500 - \$1000': 'istanbul',
    'Tropical|Partner|\$1000 - \$2000': 'bali',
    'Tropical|Partner|Above \$2000': 'hawaii',
  };

  Map<int, String> _selectedAnswers = {};

  final List<String> _backgrounds = [
    'assets/images/bg1.jpeg',
    'assets/images/bg2.jpeg',
    'assets/images/bg3.jpeg',
    'assets/images/bg4.jpeg',
    'assets/images/bg5.jpeg',
  ];

  void _onOptionSelected(int questionIndex, String option) {
    setState(() {
      if (_selectedAnswers[questionIndex] == option) {
        _selectedAnswers.remove(questionIndex);
      } else {
        _selectedAnswers[questionIndex] = option;
      }
      _backgroundIndex = (_backgroundIndex + 1) % _backgrounds.length;
    });
  }

  void _onNextPressed() {
    final selectedSeason = _selectedAnswers[0];
    final selectedCompanion = _selectedAnswers[1];
    final selectedBudget = _selectedAnswers[2];

    final seasonKey = selectedSeason == 'Autumn' ? 'Tropical' : selectedSeason;
    final key = '$seasonKey|$selectedCompanion|$selectedBudget';
    final destination = _destinationMap[key] ?? 'unknown';

    Widget? destinationPage = _getDestinationPage(destination);

    if (destinationPage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => destinationPage),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No page found for $destination')),
      );
    }
  }

  Widget? _getDestinationPage(String destination) {
    switch (destination.toLowerCase()) {
      case 'istanbul': return IstanbulPage();
      case 'cairo': return CairoPage();
      case 'harbin': return HarbinPage();
      case 'new york': return NewYorkPage();
      case 'bali': return BaliPage();
      case 'hawaii': return HawaiiPage();
      case 'barcelona': return BarcelonaPage();
      case 'dubai': return DubaiPage();
      case 'zermatt': return ZermattPage();
      case 'reykjavik': return ReykjavikPage();
      case 'paris': return ParisPage();
      case 'tokyo': return TokyoPage();
      default: return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 600),
            child: Image.asset(
              _backgrounds[_backgroundIndex],
              key: ValueKey<int>(_backgroundIndex),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravelHomePage(username: "mahak")),
                );
              },
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 100, 30, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Let’s find a perfect destination for you!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 50),
                ..._questions.asMap().entries.map((entry) {
                  int i = entry.key;
                  var question = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question['question'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: (question['options'] as List<String>)
                              .map((option) {
                            final isSelected = _selectedAnswers[i] == option;
                            return ChoiceChip(
                              label: Text(option),
                              selected: isSelected,
                              selectedColor: const Color(0xFFF8740B),
                              backgroundColor: Colors.white70,
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : Colors.black87,
                              ),
                              onSelected: (_) => _onOptionSelected(i, option),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                if (_selectedAnswers.length == _questions.length)
                  Center(
                    child: ElevatedButton(
                      onPressed: _onNextPressed,
                      style: ElevatedButton.styleFrom(
                        padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        backgroundColor: Color(0xFFF8740B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('Next'),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}