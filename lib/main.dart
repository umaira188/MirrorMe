import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'home.dart'; // Import home screen
import 'products.dart';
import 'description.dart';
import 'cart_checkout.dart';
import 'profile.dart'; // Import the profile screen
import 'wishlist.dart'; // Import Wishlist Screen

/// A global cart list to store products the user adds.
List<Map<String, dynamic>> globalCart = [];

/// Global wishlist list to store products added to the wishlist.
List<Map<String, dynamic>> globalWishlist = [];

void main() {
  runApp(const MirrorMeApp());
}

class MirrorMeApp extends StatefulWidget {
  const MirrorMeApp({super.key});

  @override
  State<MirrorMeApp> createState() => _MirrorMeAppState();
}

class _MirrorMeAppState extends State<MirrorMeApp> {
  // Holds the current theme mode, starting with system default
  final ValueNotifier<ThemeMode> _themeMode = ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeMode,
      builder: (context, themeMode, child) {
        return MaterialApp(
          title: 'Mirror Me',
          debugShowCheckedModeBanner: false, // Removes the debug banner

          // Set up light and dark themes
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: Colors.white, // Light background
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: Colors.black, // Dark background
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white), // For larger text
              bodyMedium: TextStyle(color: Colors.grey), // For medium-sized text
              bodySmall: TextStyle(color: Colors.grey), // For smaller text
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white, // White text/icon color for app bar
            ),
          ),
          themeMode: themeMode, // Dynamically set theme mode

          // Named routes for easy navigation
          routes: {
            '/': (context) => LoginScreen(toggleTheme: _toggleTheme), // Pass toggleTheme
            '/register': (context) => const RegisterScreen(),
            '/home': (context) => const HomeScreen(), // Home screen route
            '/products': (context) => const ProductsScreen(),
            '/description': (context) => const DescriptionScreen(),
            '/cart': (context) => const CartScreen(),
            '/profile': (context) => const ProfileScreen(), // ProfileScreen route
            '/wishlist': (context) => const WishlistScreen(), // WishlistScreen route
          },
          initialRoute: '/', // Start at the Login screen
        );
      },
    );
  }

  // Toggle the theme between light, dark, and system default
  void _toggleTheme() {
    setState(() {
      if (_themeMode.value == ThemeMode.system) {
        _themeMode.value = ThemeMode.light;
      } else if (_themeMode.value == ThemeMode.light) {
        _themeMode.value = ThemeMode.dark;
      } else {
        _themeMode.value = ThemeMode.system;
      }
    });
  }
}
