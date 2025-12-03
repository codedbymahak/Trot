import 'package:flutter/material.dart';

class TokyoPage extends StatelessWidget {
  const TokyoPage({super.key});

  final String cityName = 'Tokyo';
  final String imageAsset = 'assets/images/tokyo_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'Tokyo is Japan’s bustling capital, known for its mix of modern technology and traditional culture.',
    'Weather':
    'Four seasons with hot summers, mild springs, and cold winters.',
    'Tourist Attractions':
    'Tokyo Tower, Shibuya Crossing, Senso-ji Temple, Meiji Shrine, Akihabara.',
    'Transport':
    'Efficient subway and train system, buses, taxis.',
    'Hotels':
    'Variety from capsule hotels to luxury accommodations.',
    'Local Cuisine':
    'Sushi, ramen, tempura, yakitori, matcha sweets.',
    'Must Buys':
    'Electronics, anime merchandise, traditional crafts, fashion.',
    'Local Helpline Numbers':
    'Emergency: 119 (fire/ambulance), Police: 110.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      'assets/images/tokyo_tower.jpeg',
      'assets/images/tokyo_shibuya.jpeg',
      'assets/images/tokyo_sensoji.jpeg',
      'assets/images/tokyo_meiji.jpeg',
    ],
    'Transport': [
      'assets/images/tokyo_subway.jpeg',
      'assets/images/tokyo_train.jpeg',
    ],
    'Hotels': [
      'assets/images/tokyo_hotel1.jpeg',
      'assets/images/tokyo_hotel2.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/tokyo_sushi.jpeg',
      'assets/images/tokyo_ramen.jpeg',
    ],
    'Must Buys': [
      'assets/images/tokyo_electronics.jpeg',
      'assets/images/tokyo_anime_merch.jpeg',
    ],
  };

  @override
  Widget build(BuildContext context) {
    final reorderedDetails = Map<String, String>.from(cityDetails)
      ..remove('Local Helpline Numbers');

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(cityName),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black87, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cityName,
                    style:
                    Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...reorderedDetails.entries.map(
                        (entry) => Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.key,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            entry.value,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          if (sectionImages.containsKey(entry.key)) ...[
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 150,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: sectionImages[entry.key]!.length,
                                separatorBuilder: (_, __) =>
                                const SizedBox(width: 10),
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      sectionImages[entry.key]![index],
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Local Helpline Numbers',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          cityDetails['Local Helpline Numbers']!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
