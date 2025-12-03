import 'package:flutter/material.dart';

class ZermattPage extends StatelessWidget {
  const ZermattPage({super.key});

  final String cityName = 'Zermatt';
  final String imageAsset = 'assets/images/zermatt_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'Zermatt is a mountain resort in Switzerland, famous for skiing and views of the Matterhorn.',
    'Weather':
    'Cold winters with heavy snowfall and mild summers.',
    'Tourist Attractions':
    'Matterhorn, Gornergrat Railway, skiing and hiking trails, Glacier Paradise.',
    'Transport':
    'Car-free village; electric taxis, trains, and cable cars.',
    'Hotels':
    'Charming alpine hotels, chalets, and luxury resorts.',
    'Local Cuisine':
    'Swiss cheese fondue, raclette, rosti, alpine meats.',
    'Must Buys':
    'Swiss watches, chocolate, alpine souvenirs, local crafts.',
    'Local Helpline Numbers':
    'Emergency: 112, Police: 117, Fire: 118, Medical: 144.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      'assets/images/zermatt_matterhorn.jpeg',
      'assets/images/zermatt_gornergrat.jpeg',
      'assets/images/zermatt_skiing.jpeg',
      'assets/images/zermatt_glacier_paradise.jpeg',
    ],
    'Transport': [
      'assets/images/zermatt_electric_taxi.jpeg',
      'assets/images/zermatt_train.jpeg',
    ],
    'Hotels': [
      'assets/images/zermatt_hotel1.jpeg',
      'assets/images/zermatt_hotel2.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/zermatt_fondue.jpeg',
      'assets/images/zermatt_raclette.jpeg',
    ],
    'Must Buys': [
      'assets/images/zermatt_swiss_watch.jpeg',
      'assets/images/zermatt_chocolate.jpeg',
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
