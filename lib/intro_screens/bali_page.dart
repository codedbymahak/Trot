import 'package:flutter/material.dart';

class BaliPage extends StatelessWidget {
  const BaliPage({super.key});

  final String cityName = 'Bali';
  final String imageAsset = 'assets/images/bali_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'Bali is an Indonesian island known for its forested volcanic mountains, iconic rice paddies, beaches, and coral reefs.',
    'Weather':
    'Tropical climate with warm temperatures year-round and a wet season from October to March.',
    'Tourist Attractions':
    'Uluwatu Temple, Tanah Lot, Ubud Monkey Forest, Tegallalang Rice Terraces, Seminyak Beach.',
    'Transport':
    'Scooter rentals are common; taxis and shuttle buses available. Limited public transport.',
    'Hotels':
    'Options range from beachfront resorts to jungle villas and budget hostels.',
    'Local Cuisine':
    'Nasi Goreng, Satay, Babi Guling, Lawar, and fresh seafood.',
    'Must Buys':
    'Batik fabrics, silver jewelry, traditional handicrafts, coffee.',
    'Local Helpline Numbers':
    'Emergency: 112, Police: 110, Fire: 113, Medical: 118.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      'assets/images/bali_uluwatu.jpeg',
      'assets/images/bali_tanah_lot.jpeg',
      'assets/images/bali_ubud_monkey.jpeg',
      'assets/images/bali_tegallalang.jpeg',
      'assets/images/bali_seminyak.jpeg',
    ],
    'Transport': [
      'assets/images/bali_scooter.jpeg',
      'assets/images/bali_taxi.jpeg',
    ],
    'Hotels': [
      'assets/images/bali_hotel1.jpeg',
      'assets/images/bali_hotel2.jpeg',
      'assets/images/bali_hotel3.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/bali_nasi_goreng.jpeg',
      'assets/images/bali_satay.jpeg',
      'assets/images/bali_babi_guling.jpeg',
    ],
    'Must Buys': [
      'assets/images/bali_batik.jpeg',
      'assets/images/bali_silver.jpeg',
      'assets/images/bali_coffee.jpeg',
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
