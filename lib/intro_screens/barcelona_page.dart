import 'package:flutter/material.dart';

class BarcelonaPage extends StatelessWidget {
  const BarcelonaPage({super.key});

  final String cityName = 'Barcelona';
  final String imageAsset = 'assets/images/barcelona_main.jpeg';

  final Map<String, String> cityDetails = const {
    'Information':
    'Barcelona is a vibrant city in Spain, famous for its art, architecture, and Mediterranean beaches.',
    'Weather':
    'Mild winters and hot summers with Mediterranean climate.',
    'Tourist Attractions':
    'Sagrada Familia, Park Güell, La Rambla, Gothic Quarter, Montjuïc, Casa Batlló.',
    'Transport':
    'Comprehensive metro, bus, and tram system. Bicycle rentals popular.',
    'Hotels':
    'From beachfront resorts to boutique city hotels in Eixample and Barri Gòtic.',
    'Local Cuisine':
    'Tapas, paella, seafood, churros, and Catalan cream.',
    'Must Buys':
    'Wine, olive oil, ceramics, local art, leather goods.',
    'Local Helpline Numbers':
    'Emergency: 112, Medical: 061, Fire: 080, Police: 092.',
  };

  final Map<String, List<String>> sectionImages = const {
    'Tourist Attractions': [
      'assets/images/barcelona_sagrada.jpeg',
      'assets/images/barcelona_park_guell.jpeg',
      'assets/images/barcelona_rambla.jpeg',
      'assets/images/barcelona_gothic.jpeg',
      'assets/images/barcelona_montjuic.jpeg',
      'assets/images/barcelona_casa_batllo.jpeg',
    ],
    'Transport': [
      'assets/images/barcelona_metro.jpeg',
      'assets/images/barcelona_bus.jpeg',
      'assets/images/barcelona_bike.jpeg',
    ],
    'Hotels': [
      'assets/images/barcelona_hotel1.jpeg',
      'assets/images/barcelona_hotel2.jpeg',
      'assets/images/barcelona_hotel3.jpeg',
    ],
    'Local Cuisine': [
      'assets/images/barcelona_tapas.jpeg',
      'assets/images/barcelona_paella.jpeg',
      'assets/images/barcelona_churros.jpeg',
    ],
    'Must Buys': [
      'assets/images/barcelona_wine.jpeg',
      'assets/images/barcelona_ceramics.jpeg',
      'assets/images/barcelona_leather.jpeg',
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
