import 'package:flutter/material.dart';

class ReykjavikPage extends StatelessWidget {
  const ReykjavikPage({super.key});

  final String cityName = 'Reykjavik';
  final String imageAsset = 'assets/images/reykjavik_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'Reykjavik is the capital of Iceland, known for its stunning landscapes, geothermal pools, and vibrant culture.',
    'Weather':
    'Cold winters with snow and mild summers; long daylight hours in summer and long nights in winter.',
    'Tourist Attractions':
    'Blue Lagoon, Hallgrímskirkja Church, Harpa Concert Hall, Northern Lights viewing.',
    'Transport':
    'Buses and taxis available; car rentals for exploring Iceland.',
    'Hotels':
    'From boutique hotels to guesthouses and luxury resorts.',
    'Local Cuisine':
    'Seafood, lamb dishes, skyr, rye bread, and traditional Icelandic fare.',
    'Must Buys':
    'Wool products, lava jewelry, local art, Icelandic skincare.',
    'Local Helpline Numbers':
    'Emergency: 112, Police: 112, Fire: 112, Medical: 112.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      'assets/images/reykjavik_blue_lagoon.jpeg',
      'assets/images/reykjavik_hallgrimskirkja.jpeg',
      'assets/images/reykjavik_harpa.jpeg',
      'assets/images/reykjavik_northern_lights.jpeg',
    ],
    'Transport': [
      'assets/images/reykjavik_bus.jpeg',
      'assets/images/reykjavik_taxi.jpeg',
    ],
    'Hotels': [
      'assets/images/reykjavik_hotel1.jpeg',
      'assets/images/reykjavik_hotel2.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/reykjavik_seafood.jpeg',
      'assets/images/reykjavik_skyr.jpeg',
    ],
    'Must Buys': [
      'assets/images/reykjavik_wool.jpeg',
      'assets/images/reykjavik_lava_jewelry.jpeg',
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
