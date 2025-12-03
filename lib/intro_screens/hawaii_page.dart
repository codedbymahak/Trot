import 'package:flutter/material.dart';

class HawaiiPage extends StatelessWidget {
  const HawaiiPage({super.key});

  final String cityName = 'Hawaii';
  final String imageAsset = 'assets/images/hawaii_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'Hawaii is a tropical paradise in the Pacific known for its beaches, volcanoes, and unique culture.',
    'Weather':
    'Warm tropical climate with mild variation year-round.',
    'Tourist Attractions':
    'Waikiki Beach, Volcanoes National Park, Pearl Harbor, Hanauma Bay, Haleakalā National Park.',
    'Transport':
    'Car rentals are common; public buses available in urban areas.',
    'Hotels':
    'Resorts, beachfront hotels, and vacation rentals.',
    'Local Cuisine':
    'Poke, Kalua pig, Loco moco, Spam musubi, fresh seafood.',
    'Must Buys':
    'Hawaiian quilts, Kona coffee, ukuleles, tropical flowers.',
    'Local Helpline Numbers':
    'Emergency: 911, Police: 911, Fire: 911, Medical: 911.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      'assets/images/hawaii_waikiki.jpeg',
      'assets/images/hawaii_volcano.jpeg',
      'assets/images/hawaii_pearl_harbor.jpeg',
      'assets/images/hawaii_hanauma.jpeg',
      'assets/images/hawaii_haleakala.jpeg',
    ],
    'Transport': [
      'assets/images/hawaii_car_rental.jpeg',
      'assets/images/hawaii_bus.jpeg',
    ],
    'Hotels': [
      'assets/images/hawaii_hotel1.jpeg',
      'assets/images/hawaii_hotel2.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/hawaii_poke.jpeg',
      'assets/images/hawaii_loco_moco.jpeg',
    ],
    'Must Buys': [
      'assets/images/hawaii_quilt.jpeg',
      'assets/images/hawaii_kona_coffee.jpeg',
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
