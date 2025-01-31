// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 1, // Only one tab: Items
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wishlist'),
          backgroundColor: Colors.pink.shade200,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Items (0)'),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  // Empty Items Section
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 80,
                          color: isDarkMode
                              ? Colors.grey.shade500
                              : Colors.grey.shade400,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'It is empty here.',
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                isDarkMode ? Colors.grey.shade300 : Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink.shade200,
                            foregroundColor:
                                isDarkMode ? Colors.white : Colors.black,
                          ),
                          child: const Text('Remove'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // "Heart It" section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100, // Light background
                border: const Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ), // Top border
                ),
              ),
              child: SingleChildScrollView(
                // Added SingleChildScrollView
                child: Column(
                  children: [
                    Text(
                      'Heart It.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade200,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Store everything you love on one page.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                    // ...existing code...
                  ],
                ),
              ),
            )
          ],
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: BottomAppBar(
          color: Colors.pink.shade200,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? MainAxisAlignment
                          .spaceAround // Spread icons in portrait mode
                      : MainAxisAlignment
                          .spaceEvenly, // Add more spacing in landscape mode
              children: [
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.grid_view, color: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context, '/products');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context, '/wishlist');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
