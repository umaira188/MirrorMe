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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TabBarView
              Expanded(
                child: TabBarView(
                  children: [
                    // Centered Content with Scroll Support for Landscape
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height -
                              (MediaQuery.of(context).padding.top + 56 + 48), // Account for AppBar and TabBar
                        ),
                        child: Center(
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
                                  color: isDarkMode
                                      ? Colors.grey.shade300
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // "Heart It" Section
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
                  ],
                ),
              ),
            ],
          ),
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: BottomAppBar(
          color: Colors.pink.shade200,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
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
