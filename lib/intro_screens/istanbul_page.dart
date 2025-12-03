import 'package:flutter/material.dart';

class IstanbulPage extends StatelessWidget {
  const IstanbulPage({super.key});

  final String cityName = 'Istanbul';
  final String imageAsset = 'assets/images/istanbul_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'Istanbul is a transcontinental city in Turkey, straddling Europe and Asia across the Bosphorus Strait. It is known for its historic sites, vibrant culture, and stunning skyline.',
    'Weather':
    'Mild and wet winters with temperatures around 8–10°C. Occasional snowfall makes the city picturesque.',
    'Tourist Attractions':
    'Hagia Sophia, Blue Mosque, Topkapi Palace, Bosphorus Cruise, Grand Bazaar, Galata Tower, and Basilica Cistern.',
    'Transport':
    'Comprehensive transport with trams, metro, ferries, and buses. Istanbulkart allows easy access across modes.',
    'Hotels':
    'Accommodation ranges from luxurious Bosphorus-view hotels to charming boutique stays in Sultanahmet and Beyoğlu.',
    'Local Cuisine':
    'Kebabs, mezes, baklava, simit, Turkish delight, and traditional Turkish tea and coffee.',
    'Must Buys':
    'Spices, Turkish rugs, lanterns, ceramics, tea sets, and handmade soaps.',
    'Local Helpline Numbers':
    'Emergency: 112, Medical: 113, Fire: 110, Police: 155.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      'assets/images/hagia_sophia.jpeg',
      'assets/images/blue_mosque.jpeg',
      'assets/images/topkapi.jpeg',
      'assets/images/bosphorus.jpeg',
      'assets/images/grand_bazaar.jpeg',
      'assets/images/galata_tower.jpeg',
      'assets/images/basilica_cistern.jpeg',
    ],
    'Transport': [
      'assets/images/istanbul_tram.jpeg',
      'assets/images/istanbul_ferry.jpeg',
      'assets/images/istanbul_metro.jpeg',
    ],
    'Hotels': [
      'assets/images/istanbul_hotel1.jpeg',
      'assets/images/istanbul_hotel2.jpeg',
      'assets/images/istanbul_hotel3.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/kebab.jpeg',
      'assets/images/baklava.jpeg',
      'assets/images/simit.jpeg',
      'assets/images/turkish_tea.jpeg',
    ],
    'Must Buys': [
      'assets/images/spices.jpeg',
      'assets/images/rug.jpeg',
      'assets/images/lantern.jpeg',
      'assets/images/ceramic.jpeg',
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
