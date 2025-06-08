import 'package:flutter/material.dart';
import '../models/product.dart'; // Import your Product model
import '../main.dart'; // To access globalCart and globalWishlist

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: TextStyle(
            fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                ? 18
                : 20,
          ),
        ),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: product.id.toString(),
                  child: Container(
                    height: isPortrait ? constraints.maxHeight * 0.4 : constraints.maxHeight * 0.5,
                    decoration: const BoxDecoration(color: Colors.black12),
                    child: Image.network( // Load from network
                      'http://192.168.8.137:8000/storage/${product.imagePath}',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  product.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isPortrait ? 20 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Rs ${product.price}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isPortrait ? 16 : 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: isPortrait ? 14 : 16),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.add_shopping_cart),
                        label: const Text('Add to Cart'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                        onPressed: () {
                          if (!globalCart1.contains(product)) {
                            globalCart1.add(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Product added to cart!')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Product already in cart!')),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.favorite_border),
                        label: const Text('Add to Wishlist'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade100,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          if (!globalWishlist1.contains(product)) {
                            globalWishlist1.add(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Product added to wishlist!')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Product already in wishlist!')),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MediaQuery.of(context).orientation == Orientation.portrait
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.black),
                onPressed: () => Navigator.pushNamed(context, '/home'),
              ),
              IconButton(
                icon: const Icon(Icons.grid_view, color: Colors.black),
                onPressed: () => Navigator.pushNamed(context, '/products'),
              ),
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.black),
                onPressed: () => Navigator.pushNamed(context, '/wishlist'),
              ),
              IconButton(
                icon: const Icon(Icons.person, color: Colors.black),
                onPressed: () => Navigator.pushNamed(context, '/profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
