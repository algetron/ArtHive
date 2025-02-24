import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../widgets/appbar/main_appbar.dart';
import '../../widgets/navbar/navbar.dart';
import '../../models/product.dart' as models; // Use the same alias

class MainPage extends StatelessWidget {
  final List<String> categories = [
    'All',
    'Furniture',
    'Sculpture',
    'Pottery',
    'Figurine',
    'Others'
  ];

  final List<models.Product> products = [
    models.Product(
        name: 'Ceramic Flower Base',
        image: 'images/base.jpg',
        price: 545,
        maker: 'Lebron james',
        description: 'gawa ito sa ceramic wala naisip ko lang'),
    models.Product(
        name: 'Wooden Fruit Bowl',
        image: 'images/bowl.jpg',
        price: 800,
        maker: 'Jose Protacio',
        description: 'nakuha ang kahoy nito sa bundok ng cavite'),
    models.Product(
        name: 'Stone Art',
        image: 'images/stone.jpg',
        price: 99,
        maker: 'skusta clee',
        description:
            'gawa sa bato ng Silang cavite nakuha sa ilalim ng puno ng kalamansi'),
    models.Product(
        name: 'Wooden Bag Fashion',
        image: 'images/bag.jpg',
        price: 1499,
        maker: 'maloi garcia',
        description: 'mahilig ako gumawa ng ganito naisip ko lang'),
    models.Product(
        name: 'Steel Art Desk',
        image: 'images/steelart.jpg',
        price: 445,
        maker: 'maangaas aiah',
        description: 'steel art para sa mga taong steel in love'),
    models.Product(
        name: 'Wood Art for Table',
        image: 'images/tree.jpg',
        price: 1599,
        maker: 'mae cruz',
        description: 'gawa sa puno ang punong kahoy na ito kasi diba wood nga'),
    models.Product(
        name: 'Ceramic Flower Base',
        image: 'images/base.jpg',
        price: 545,
        maker: 'Lebron james',
        description: 'gawa ito sa ceramic wala naisip ko lang'),
    models.Product(
        name: 'Wooden Fruit Bowl',
        image: 'images/bowl.jpg',
        price: 800,
        maker: 'Jose Protacio',
        description: 'nakuha ang kahoy nito sa bundok ng cavite'),
    models.Product(
        name: 'Stone Art',
        image: 'images/stone.jpg',
        price: 99,
        maker: 'skusta clee',
        description:
            'gawa sa bato ng Silang cavite nakuha sa ilalim ng puno ng kalamansi'),
    models.Product(
        name: 'Wooden Bag Fashion',
        image: 'images/bag.jpg',
        price: 1499,
        maker: 'maloi garcia',
        description: 'mahilig ako gumawa ng ganito naisip ko lang'),
    models.Product(
        name: 'Steel Art Desk',
        image: 'images/steelart.jpg',
        price: 445,
        maker: 'maangaas aiah',
        description: 'steel art para sa mga taong steel in love'),
    models.Product(
        name: 'Wood Art for Table',
        image: 'images/tree.jpg',
        price: 1599,
        maker: 'mae cruz',
        description: 'gawa sa puno ang punong kahoy na ito kasi diba wood nga'),
    models.Product(
        name: 'Ceramic Flower Base',
        image: 'images/base.jpg',
        price: 545,
        maker: 'Lebron james',
        description: 'gawa ito sa ceramic wala naisip ko lang'),
    models.Product(
        name: 'Wooden Fruit Bowl',
        image: 'images/bowl.jpg',
        price: 800,
        maker: 'Jose Protacio',
        description: 'nakuha ang kahoy nito sa bundok ng cavite'),
    models.Product(
        name: 'Stone Art',
        image: 'images/stone.jpg',
        price: 99,
        maker: 'skusta clee',
        description:
            'gawa sa bato ng Silang cavite nakuha sa ilalim ng puno ng kalamansi'),
    models.Product(
        name: 'Wooden Bag Fashion',
        image: 'images/bag.jpg',
        price: 1499,
        maker: 'maloi garcia',
        description: 'mahilig ako gumawa ng ganito naisip ko lang'),
    models.Product(
        name: 'Steel Art Desk',
        image: 'images/steelart.jpg',
        price: 445,
        maker: 'maangaas aiah',
        description: 'steel art para sa mga taong steel in love'),
    models.Product(
        name: 'Wood Art for Table',
        image: 'images/tree.jpg',
        price: 1599,
        maker: 'mae cruz',
        description: 'gawa sa puno ang punong kahoy na ito kasi diba wood nga'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(), // Use the extracted AppBar
      body: Column(
        children: [
          // Categories
          SizedBox(
            height: 40,
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
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: index == 0 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Products Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.productDetails,
                      arguments: products[index],
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 225, 207),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                            child: Image.asset(
                              products[index].image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '₱${products[index].price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 25, 63, 25),
                                ),
                              ),
                            ],
                          ),
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
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}
