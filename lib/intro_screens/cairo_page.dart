import 'package:flutter/material.dart';

class CairoPage extends StatelessWidget {
  const CairoPage({super.key});

  final String cityName = 'Cairo';
  final String imageAsset = 'assets/images/cairo_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'Cairo, the capital of Egypt, is famous for its rich history, pyramids, and vibrant street life.',
    'Weather':
    'Hot desert climate with very hot summers and mild winters.',
    'Tourist Attractions':
    'Pyramids of Giza, Egyptian Museum, Khan El Khalili Bazaar, Citadel of Cairo.',
    'Transport':
    'Metro system, taxis, minibusses, and ride-hailing apps are common.',
    'Hotels':
    'Variety from luxury resorts near the Nile to budget accommodations downtown.',
    'Local Cuisine':
    'Koshari, Ful Medames, Taameya, Molokhia, and fresh dates.',
    'Must Buys':
    'Papyrus art, spices, perfumes, jewelry, and carpets.',
    'Local Helpline Numbers':
    'Emergency: 122, Medical: 123, Fire: 180, Police: 122.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      'assets/images/cairo_pyramids.jpeg',
      'assets/images/cairo_museum.jpeg',
      'assets/images/cairo_bazaar.jpeg',
      'assets/images/cairo_citadel.jpeg',
    ],
    'Transport': [
      'assets/images/cairo_metro.jpeg',
      'assets/images/cairo_taxi.jpeg',
    ],
    'Hotels': [
      'assets/images/cairo_hotel1.jpeg',
      'assets/images/cairo_hotel2.jpeg',
      'assets/images/cairo_hotel3.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/cairo_koshari.jpeg',
      'assets/images/cairo_ful_medames.jpeg',
      'assets/images/cairo_taameya.jpeg',
    ],
    'Must Buys': [
      'assets/images/cairo_papyrus.jpeg',
      'assets/images/cairo_spices.jpeg',
      'assets/images/cairo_jewelry.jpeg',
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
