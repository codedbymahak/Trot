import 'package:flutter/material.dart';

class ParisPage extends StatelessWidget {
  const ParisPage({super.key});

  final String cityName = 'Paris';
  final String imageAsset = 'assets/images/paris_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'Paris is the capital of France, known for its art, fashion, and culture. The city is home to famous landmarks such as the Eiffel Tower, the Louvre Museum, and the Notre-Dame Cathedral.',
    'Weather':
    'Cold winters with average temperatures around 5°C in January. Occasional snowfall adds charm to the historic streets.',
    'Tourist Attractions':
    'Eiffel Tower, Louvre Museum, Notre-Dame Cathedral, Montmartre, Champs-Élysées, Palace of Versailles, Seine River cruise, Eiffel Tower at night, walk through Montmartre, and sunset at Sacré-Cœur.',
    'Transport':
    'Efficient public transport with metro, buses, and trams. Rental bikes and electric scooters are also available.',
    'Hotels':
    'Wide range of hotels from budget to luxury. Areas like Le Marais and Latin Quarter are traveler favorites.',
    'Local Cuisine':
    'Croissants, escargot, coq au vin, crepes, and macarons.',
    'Must Buys':
    'Perfume, wine, local cheese, designer fashion, and French cosmetics.',
    'Local Helpline Numbers':
    'Emergency: 112, Medical: 15, Fire: 18, Police: 17.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      'assets/images/eiffel.jpeg',
      'assets/images/louvre.jpeg',
      'assets/images/notre_dame.jpeg',
      'assets/images/seine.jpeg',
      'assets/images/eiffel_night.jpeg',
      'assets/images/montmartre.jpeg',
      'assets/images/sacre_coeur.jpeg',
    ],
    'Transport': [
      'assets/images/metro.jpeg',
      'assets/images/bus.jpeg',
      'assets/images/bike.jpeg',
    ],
    'Hotels': [
      'assets/images/hotel1.jpeg',
      'assets/images/hotel2.jpeg',
      'assets/images/hotel3.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/croissant.jpeg',
      'assets/images/escargot.jpeg',
      'assets/images/coq_au_vin.jpeg',
      'assets/images/macaron.jpeg',
    ],
    'Must Buys': [
      'assets/images/perfume.jpeg',
      'assets/images/wine.jpeg',
      'assets/images/cheese.jpeg',
      'assets/images/fashion.jpeg',
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
