import 'package:flutter/material.dart';

class DubaiPage extends StatelessWidget {
  const DubaiPage({super.key});

  final String cityName = 'Dubai';
  final String imageAsset = 'assets/images/dubai_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'Dubai is a futuristic city in the United Arab Emirates known for its skyscrapers, luxury shopping, and desert adventures.',
    'Weather':
    'Hot desert climate with very hot summers and mild winters.',
    'Tourist Attractions':
    'Burj Khalifa, Dubai Mall, Palm Jumeirah, Dubai Fountain, Desert Safari.',
    'Transport':
    'Modern metro system, taxis, buses, and plenty of car rentals.',
    'Hotels':
    'World-class luxury hotels, resorts, and serviced apartments.',
    'Local Cuisine':
    'Shawarma, machboos, hummus, falafel, and Arabic coffee.',
    'Must Buys':
    'Gold jewelry, perfumes, spices, dates, and textiles.',
    'Local Helpline Numbers':
    'Emergency: 999, Medical: 998, Fire: 997, Police: 999.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      'assets/images/dubai_burj_khalifa.jpeg',
      'assets/images/dubai_mall.jpeg',
      'assets/images/dubai_palm.jpeg',
      'assets/images/dubai_fountain.jpeg',
      'assets/images/dubai_desert.jpeg',
    ],
    'Transport': [
      'assets/images/dubai_metro.jpeg',
      'assets/images/dubai_taxi.jpeg',
    ],
    'Hotels': [
      'assets/images/dubai_hotel1.jpeg',
      'assets/images/dubai_hotel2.jpeg',
      'assets/images/dubai_hotel3.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/dubai_shawarma.jpeg',
      'assets/images/dubai_machboos.jpeg',
      'assets/images/dubai_falafel.jpeg',
    ],
    'Must Buys': [
      'assets/images/dubai_gold.jpeg',
      'assets/images/dubai_perfume.jpeg',
      'assets/images/dubai_dates.jpeg',
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
