import 'package:flutter/material.dart';
import 'main.dart'; // so we can add items to globalCart

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the product from the arguments
    final product =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product['name'],
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
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isPortrait =           //Checks Orientation
          MediaQuery.of(context).orientation == Orientation.portrait;
        
      return SingleChildScrollView(
         padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero target to animate from the Products grid
            // // Adjust the space occupied by the image
            Hero(
              tag: product['id'],
               child: Container(
                height: isPortrait
                          ? constraints.maxHeight * 0.4 // 40% height for portrait
                          : constraints.maxHeight * 0.5,  // 50% height for landscape
                        decoration: const BoxDecoration(
               color: Colors.black12, //Optional Background
                ),  
               child: Image.asset(
                product['image'],
                 fit: BoxFit.contain, // Ensures full visibility
               ),
            ),
            ),
              const SizedBox(height: 16), // Adjusted spacing
            
            //Product Name
            Text(
              product['name'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isPortrait ? 20: 24,  // Adjust font size
                 fontWeight: FontWeight.bold,
            ),
        ),
            const SizedBox(height: 10), // Adjusted spacing

            //Product price
            Text(
              'Rs ${product['price']}',
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontSize: isPortrait ? 16 : 18,  // Adjust font size
                 fontWeight: FontWeight.w500,
            ),
            ),
        
          const SizedBox(height: 10), //Spacing added after price

            //Product description
              Text(
              product['description'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isPortrait ? 14: 16,
             ),   
                  ),
            const SizedBox(height: 20), //Spacing after buttons

            //Action Buttons
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // Ensures buttons stretch
            children: [
               ElevatedButton.icon(
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              onPressed: () {
                // Add item to the Cart
                globalCart.add(product);
                // Show confirmation
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Product added to cart!'),
                 ),
                          );
                        },
                      ),
                    
            // Add to Wishlist button
const SizedBox(height: 10), // Add spacing between buttons
 ElevatedButton.icon(
  icon: const Icon(Icons.favorite_border),
  label: const Text('Add to Wishlist'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.pink,
),
  onPressed: () {
    // Add product to wishlist logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to Wishlist!'),
  ),
                          );
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

      //Bottom Navigation Bar
      bottomNavigationBar: LayoutBuilder(
         builder: (context, constraints) {
          final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

        return BottomAppBar(
        color: Colors.pink.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
          mainAxisAlignment: isPortrait
          ? MainAxisAlignment.spaceAround // Spread icons in portrait
          : MainAxisAlignment.center,     // Center icons in landscape
          children: isPortrait
          ? [
            IconButton( //Home Icon
              icon: const Icon(Icons.home, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            IconButton( //products Icon
             icon: const Icon(Icons.grid_view, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/products');
              },
            ),
            IconButton( //Wishlist Icon
             icon: const Icon(Icons.favorite, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/wishlist');
              },
            ),
            IconButton( //Profile Icon
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
                },
                  ),
                ]
              : [
                 const Spacer(), // Adds spacing to the left
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.grid_view, color: Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(context, '/products');
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(context, '/wishlist');
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.black),
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                  const Spacer(), // Adds spacing to the right
                ],
        ),
      ),
    );
  },
),
    );
  }
}