import 'package:flutter/material.dart';
import '../screens/Home/main_page.dart';
import '../screens/Artisans/artisans_page.dart';
import '../screens/Profiles/profile_page.dart';
import '../screens/Home/product_details_page.dart';
import '../screens/Profiles/artisan_profile_page.dart';
import '../models/product.dart' as models; // Use an alias to avoid conflicts

class AppRoutes {
  static const String home = '/';
  static const String artisans = '/artisans';
  static const String profile = '/profile';
  static const String productDetails = '/product-details';
  static const String artisanProfile = '/artisan-profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => MainPage());

      case artisans:
        return MaterialPageRoute(builder: (_) => ArtisansPage());

      case profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());

      case artisanProfile:
        return MaterialPageRoute(builder: (_) => const ArtisanProfilePage());

      case productDetails:
        if (settings.arguments is models.Product) {
          final models.Product product = settings.arguments as models.Product;
          return MaterialPageRoute(
            builder: (_) => ProductDetailsPage(product: product),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('Page not found')),
      ),
    );
  }
}
