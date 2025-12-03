import 'package:flutter/material.dart';

class NewYorkPage extends StatelessWidget {
  const NewYorkPage({super.key});

  final String cityName = 'New York';
  final String imageAsset = 'assets/images/newyork_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'New York City is a global hub known for its iconic skyline, cultural diversity, and vibrant arts scene.',
    'Weather':
    'Four distinct seasons with cold winters and hot summers.',
    'Tourist Attractions':
    'Statue of Liberty, Central Park, Times Square, Broadway, Empire State Building, Museums.',
    'Transport':
    'Extensive subway system, buses, taxis, and bike-sharing programs.',
    'Hotels':
    'Wide range from budget to luxury hotels and boutique stays.',
    'Local Cuisine':
    'Bagels, pizza, hot dogs, cheesecake, diverse international cuisines.',
    'Must Buys':
    'Broadway show tickets, souvenirs, fashion items, artisanal food products.',
    'Local Helpline Numbers':
    'Emergency: 911, Police: 911, Fire: 911, Medical: 911.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      "assets/images/newyork_statue_liberty.jpeg",
      'assets/images/newyork_central_park.jpeg',
      'assets/images/newyork_times_square.jpeg',
      'assets/images/newyork_empire_state.jpeg',
    ],
    'Transport': [
      'assets/images/newyork_subway.jpeg',
      'assets/images/newyork_taxi.jpeg',
    ],
    'Hotels': [
      'assets/images/newyork_hotel1.jpeg',
      'assets/images/newyork_hotel2.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/newyork_pizza.jpeg',
      'assets/images/newyork_bagel.jpeg',
    ],
    'Must Buys': [
      'assets/images/newyork_broadway_ticket.jpeg',
      'assets/images/newyork_souvenirs.jpeg',
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
