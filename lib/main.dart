import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'home.dart';  //import home screen
import 'products.dart';
import 'description.dart';
import 'cart_checkout.dart';
import 'profile.dart'; // Import the profile screen
import 'wishlist.dart'; // import Wishlist Screen

/// A global cart list to store products the user adds.
/// In a real app, you'd use Provider or another state management approach.
List<Map<String, dynamic>> globalCart = [];

void main() {
  runApp(const MirrorMeApp());
}

class MirrorMeApp extends StatelessWidget {
  const MirrorMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirror Me',
      debugShowCheckedModeBanner: false, // Removes the debug banner
      
      // Set up light/dark themes to fulfill “Light and Dark Mode” 
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.pink,
      ),
      themeMode: ThemeMode.system, // Automatically uses device theme setting

      // Named routes for easy navigation
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(), //Home screen route
        '/products': (context) => const ProductsScreen(),
        '/description': (context) => const DescriptionScreen(),
        '/cart': (context) => const CartScreen(),
        '/profile': (context) => const ProfileScreen(), // ProfileScreen route
        '/wishlist': (context) => const WishlistScreen(),
      },
      initialRoute: '/', // Start at the Login screen
    );
  }
}
