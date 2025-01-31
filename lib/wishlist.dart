import 'package:flutter/material.dart';
import 'main.dart'; // Import globalWishlist

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    print(globalWishlist); // Debug: Check contents of globalWishlist
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.pink.shade200,
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                'Assets/images/LOGO.jpg',
                height: 40,
              ),
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
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
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
              'Wishlist',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          globalWishlist.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text(
                      'Your wishlist is empty!',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: globalWishlist.length,
                    itemBuilder: (context, index) {
                      final product = globalWishlist[index];
                      return ListTile(
                        leading: Image.asset(
                          product['image'],
                          width: 50,
                        ),
                        title: Text(product['name']),
                        subtitle: Text('Rs ${product['price']}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              globalWishlist.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: const Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MediaQuery.of(context).orientation ==
                    Orientation.portrait
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
    );
  }
}
