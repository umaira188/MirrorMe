import 'package:flutter/material.dart';
import '../models/product.dart';
import 'main.dart'; // globalCart as List<Product>

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = globalCart1.fold(0, (sum, item) => sum + (item.price ?? 0));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('Assets/images/LOGO.jpg', height: 40),
            const SizedBox(width: 10),
            const Text(
              'MIRROR ME',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink.shade200),
              child: Column(
                children: [
                  Image.asset('assets/images/LOGO.jpg', height: 60),
                  const SizedBox(height: 10),
                  const Text(
                    'Mirror Me',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
            ...[
              {'icon': Icons.home, 'title': 'Home', 'route': '/home'},
              {'icon': Icons.grid_view, 'title': 'Products', 'route': '/products'},
              {'icon': Icons.favorite_border, 'title': 'Wishlist', 'route': '/wishlist'},
              {'icon': Icons.person, 'title': 'Profile', 'route': '/profile'},
              {'icon': Icons.shopping_cart, 'title': 'Cart', 'route': '/cart'},
            ].map((item) => ListTile(
                  leading: Icon(item['icon'] as IconData),
                  title: Text(item['title'] as String),
                  onTap: () => Navigator.pushNamed(context, item['route'] as String),
                )),
          ],
        ),
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.pink.shade50,
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Cart and Checkout',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),

          globalCart1.isEmpty
              ? const Expanded(child: Center(child: Text('Your cart is empty!')))
              : Expanded(
                  child: ListView.builder(
                    itemCount: globalCart1.length,
                    itemBuilder: (context, index) {
                      final Product product = globalCart1[index];
                      return ListTile(
                        leading: Image.network(
                          'http://192.168.8.137:8000/storage/${product.imagePath}',
                          width: 50,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported),
                        ),
                        title: Text(product.name ?? 'Unknown'),
                        subtitle: Text('Rs ${product.price ?? 0}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              globalCart1.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),

          Container(
            color: Colors.pink.shade50,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: Rs $totalPrice',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  onPressed: () {
                    setState(() {
                      globalCart1.clear();
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Order placed successfully!')),
                    );
                  },
                  child: const Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.pink.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MediaQuery.of(context).orientation == Orientation.portrait
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.spaceEvenly,
            children: [
              {'icon': Icons.home, 'route': '/home'},
              {'icon': Icons.grid_view, 'route': '/products'},
              {'icon': Icons.favorite, 'route': '/wishlist'},
              {'icon': Icons.person, 'route': '/profile'},
            ].map((item) => IconButton(
                  icon: Icon(item['icon'] as IconData, color: Colors.black),
                  onPressed: () => Navigator.pushNamed(context, item['route'] as String),
                )).toList(),
          ),
        ),
      ),
    );
  }
}
