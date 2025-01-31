import 'package:flutter/material.dart';
import 'main.dart'; // for globalCart

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // Calculate total price
    double totalPrice = 0;
    for (var item in globalCart) {
      totalPrice += (item['price'] as double);
    }

    return Scaffold(
      // Top Navigation Bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.pink.shade200,
          elevation: 0,
          title: Row(
            children: [
              // Logo
              Image.asset(
                'Assets/images/LOGO.jpg', // Replace with your logo path
                height: 40,
              ),
              const SizedBox(width: 10),
              // Title
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
                Scaffold.of(context).openDrawer(); // Open the Drawer
              },
            ),
          ],
        ),
      ),

      // Navigation Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink.shade200,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/LOGO.jpg', // Logo in Drawer
                    height: 60,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Mirror Me',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.grid_view),
              title: const Text('Products'),
              onTap: () {
                Navigator.pushNamed(context, '/products');
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border), //Wishlist Icon
              title: const Text('Wishlist'),
              onTap: () {
                Navigator.pushNamed(context, '/wishlist');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
        leading: const Icon(Icons.shopping_cart), // Cart Icon
        title: const Text('Cart'),
        onTap: () {
          Navigator.pushNamed(context, '/cart'); // Navigate to Cart screen
        },
      ),
          ],
        ),
      ),

// Body Section
      body: Column(
        children: [
          // Title: "Cart and Checkout"
          Container(
            width: double.infinity,
            color: Colors.pink.shade50,
            padding: const EdgeInsets.all(16),
            child: const Text(
              'Cart and Checkout',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Inorder to improve the contrast
              ),
            ),
          ),

       // Checkout Section
      // If cart is empty, show a message, else show a list
      globalCart.isEmpty
          ? const Expanded(
            child: Center(child: Text('Your cart is empty!')),
          )
          
          
                :Expanded(
                  child: ListView.builder(
                    itemCount: globalCart.length,
                    itemBuilder: (context, index) {
                      final product = globalCart[index];
                      return ListTile(
                        leading: Image.asset(
                          product['image'],
                          width: 50,
                        ),
                        title: Text(product['name']),
                        subtitle: Text('Rs ${product['price']}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              globalCart.removeAt(index);
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
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,
                            color: Colors.black,
                         ), // To improve visibility
                      ),
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                        onPressed: () {
                          // "Place Order" - clear the cart
                          setState(() {
                            globalCart.clear();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Order placed successfully!'),
                            ),
                          );
                        },
                        child: const Text('Checkout'),
                      )
                    ],
                  ),
                )
              ],
            ),

      //Bottom Navigation Bar
       bottomNavigationBar: BottomAppBar(
  color: Colors.pink.shade200,
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      mainAxisAlignment: MediaQuery.of(context).orientation == Orientation.portrait
          ? MainAxisAlignment.spaceAround // Spread icons in portrait mode
          : MainAxisAlignment.spaceEvenly, // Add more spacing in landscape mode
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
