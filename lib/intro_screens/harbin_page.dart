import 'package:flutter/material.dart';

class HarbinPage extends StatelessWidget {
  const HarbinPage({super.key});

  final String cityName = 'Harbin';
  final String imageAsset = 'assets/images/harbin_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'Harbin is a Chinese city famous for its cold winters and the annual Harbin Ice and Snow Festival.',
    'Weather':
    'Very cold winters with heavy snowfall and mild summers.',
    'Tourist Attractions':
    'Harbin Ice Festival, Saint Sophia Cathedral, Sun Island, Siberian Tiger Park.',
    'Transport':
    'Metro system, buses, taxis, and bike rentals available.',
    'Hotels':
    'Hotels range from ice-themed lodges to international chains.',
    'Local Cuisine':
    'Dongbei cuisine including dumplings, hot pot, and Russian-influenced dishes.',
    'Must Buys':
    'Ice sculptures (miniature), handicrafts, fur products, local snacks.',
    'Local Helpline Numbers':
    'Emergency: 110, Fire: 119, Medical: 120, Police: 110.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      'assets/images/harbin_ice_festival.jpeg',
      'assets/images/harbin_sophia_cathedral.jpeg',
      'assets/images/harbin_sun_island.jpeg',
      'assets/images/harbin_tiger_park.jpeg',
    ],
    'Transport': [
      'assets/images/harbin_metro.jpeg',
      'assets/images/harbin_bus.jpeg',
    ],
    'Hotels': [
      'assets/images/harbin_hotel1.jpeg',
      'assets/images/harbin_hotel2.jpeg',
      'assets/images/harbin_hotel3.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/harbin_dumplings.jpeg',
      'assets/images/harbin_hot_pot.jpeg',
    ],
    'Must Buys': [
      'assets/images/harbin_fur.jpeg',
      'assets/images/harbin_handicraft.jpeg',
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
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
                  // Add Local Helpline Numbers at the end
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Local Helpline Numbers',
                          style:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
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
