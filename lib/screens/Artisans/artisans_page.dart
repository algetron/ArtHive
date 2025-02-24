// artisans_page.dart
import 'package:flutter/material.dart';
import '../../models/artisans.dart';
import 'artisan_details_page.dart';
import '../../widgets/appbar/main_appbar.dart';
import '../../widgets/navbar/navbar.dart';

class ArtisansPage extends StatelessWidget {
  ArtisansPage({super.key});

  final List<String> categories = const [
    'Region 4-A',
    'Cavite',
    'Laguna',
    'Batangas',
    'Rizal',
    'Quezon'
  ];

  final List<Artisan> artisans = [
    Artisan(
      name: 'Juan Dela Cruz',
      location: 'Cavite',
      description:
          'Juan Dela Cruz is from cavite and he is a lorem ipsum lorem ipsum lorem ipsum that lorem upsum roze lorem ipsum lorem ipsum lorem ispndn',
      profileImage: 'assets/images/batacs.jpg',
      productImages: [
        'assets/images/base.jpg',
        'assets/images/tree.jpg',
      ],
    ),
    Artisan(
      name: 'Joel Malupiton',
      location: 'Cavite',
      description:
          'Juan Dela Cruz is from cavite and he is a lorem ipsum lorem ipsum lorem ipsum that lorem upsum roze lorem ipsum lorem ipsum lorem ispndn',
      profileImage: 'assets/images/malupit.jpg',
      productImages: [
        'assets/images/steelart.jpg',
        'assets/images/bowl.jpg',
      ],
    ),
    Artisan(
      name: 'Stone Art PH',
      location: 'Cavite',
      description:
          'Juan Dela Cruz is from cavite and he is a lorem ipsum lorem ipsum lorem ipsum that lorem upsum roze lorem ipsum lorem ipsum lorem ispndn',
      profileImage: 'assets/images/algerr.jpg',
      productImages: [
        'assets/images/stone.jpg',
        'assets/images/bag.jpg',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          // Categories list
          Container(
            height: 40,
            margin: const EdgeInsets.only(bottom: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextButton(
                    onPressed: () {
                      // Handle category selection
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      minimumSize: Size.zero,
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: index == 0 ? Colors.green : Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Artisan listings
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: artisans.length,
              itemBuilder: (context, index) {
                final artisan = artisans[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArtisanDescPage(artisan: artisan),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 228, 206),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Profile image
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(artisan.profileImage),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Name and location
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  artisan.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  artisan.location,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Product images
                        Row(
                          children: artisan.productImages.map((imageUrl) {
                            return Expanded(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}
