// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mirror_me/description.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      // Top Navigation Bar   
      backgroundColor: Colors.pink.shade200,
      elevation: 0,
      title: Row(
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Image.asset(
              'Assets/images/LOGO.jpg', // logo path
              height: 40,
            ),
          ),
          const SizedBox(width: 2),
          // Title
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 2),
              child: const Text(
                'MIRROR ME',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
              ),
            ),
          ),
        ],
      ),
     actions: [
      // Login Button
       IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.login, color: Colors.black),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/'); // Navigate to Login screen
            },
          ),
          const SizedBox(width: 10), // Space between buttons

      //Cart icon
    IconButton(
      icon: const Icon(Icons.shopping_cart, color: Colors.black), // Cart Icon
      onPressed: () {
        Navigator.pushNamed(context, '/cart'); // Navigate to Cart
      }
    ),
     ],
  ),
         
       
               // Body
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 600; // Check if the screen is Wide
          return SingleChildScrollView(
            child: Column(
              children: [
                // Pass both `context` and `isWide` 
                 _buildHeroSection(context, isWide), //Adjusting Hero section Layout
                 _buildSectionTitle('New Arrivals'),
                 _buildProductList(context, isWide), //Adjust Product list Layout
                 _buildSectionTitle('Why Choose Us?'),
                 _buildWhyChooseSection(context, isWide), //Adjust Why choose us Layout
               
              ],
            ),
          );
        },
      ),

      // Bottom Navigation Bar
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
            // Hero Section
   Widget _buildHeroSection(BuildContext context, bool isWide) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      color: Colors.pink.shade50,
      padding: const EdgeInsets.all(16),
      child: isPortrait
      ? Column(
        children: [
        
             Image.asset(
              'Assets/images/Mirror Me Main.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
        
          const SizedBox(height: 20),
          const Text(
           
                  'Beauty Inspired\n By Real Life.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Your Perfect Match, Every Time. Whether you\'re seeking the perfect foundation, bold lip colors, or nourishing skincare solutions, We have you covered!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/products');
                  },
                  child: const Text('Shop Now'),
               ),
              ],
            )
            : Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'Assets/images/Mirror Me Main.jpg',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 3,
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      const Text(
                      'Beauty Inspired\n By Real Life.',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      ),
                       const SizedBox(height: 10),
                    const Text(
                      'Your Perfect Match, Every Time. Whether you\'re seeking the perfect foundation, bold lip colors, or nourishing skincare solutions, We have you covered!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                         ),
                    ),
                     const SizedBox(height: 10),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                      onPressed: () {
                        Navigator.pushNamed(context, '/products');
                      },
                      child: const Text('Shop Now'),
                    ),
                    ],
                  ),
                ),
              ],
            ),
     );       
    }
  // Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Product List
 Widget _buildProductList(BuildContext parentContext, bool isWide) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal, //Horizontal Scrolling for all devices
        padding:  EdgeInsets.symmetric(
           horizontal: isWide ? 40 : 20,), // Add dynamic horizontal padding
        children: [
          _buildNewArrivalCard(
           parentContext, // Pass parent context here
            'Assets/images/LA Girl PRO.Coverage Foundation.jpg',
            'LA Girl PRO.Coverage Foundation',
            'A premium high-definition, long-wear foundation that offers a flawless, natural finish. Designed to provide exceptional coverage while feeling lightweight on the skin, this foundation is perfect for creating a smooth and radiant complexion that lasts all day.',
            4000.00,
            '1',
          ),
          _buildNewArrivalCard(
            parentContext, // Pass parent context here
            'Assets/images/Beauty Of Joseon Revive Serum.jpg',
            'Beauty Of Joseon Serum',
            'A deeply nourishing serum formulated with a unique blend of premium herbal extracts to hydrate, rejuvenate, and restore your skin. Enriched with antioxidants and essential nutrients.',
            5650.00,
            '2',
          ),
           _buildNewArrivalCard(
            parentContext, // Pass parent context here
            'Assets/images/Swiss Beauty Lipstick.jpg',
            'Swiss Beauty Lipstick',
            'Richly pigmented, providing a bold and vibrant color payoff in just one swipe. Its luxurious formula delivers high color impact, ensuring your lips stand out effortlessly. Perfect for all-day wear!',
            3500.00,
              '3',
          ),
           _buildNewArrivalCard(
            parentContext, // Pass parent context here
            'Assets/images/Matte Eyeliner.jpg',
             'Chrome & Matte Eyeshadow',
             'Duo Eyeshadow with Matte and Chrome finish. A velvety matte shade for a smooth and seamless base, and a dazzling chrome finish for an extra touch of glamour.',
            6200.00,
               '4',
           ),   
        ],
      ),
    );
 }
  

  // Helper to build "New Arrival" Product Card
    Widget _buildNewArrivalCard(
    BuildContext context, // Add BuildContext here
    String imgPath,
    String title,
    String description,
    double price, //price is double
    String id,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescriptionScreen(),
            settings: RouteSettings(
              arguments: {
            'id': id,
            'image': imgPath,
            'name': title,
            'description': description,
            'price': price,
           },
            ),
          ),
        );
      },
    
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 16),
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade300,
                      child: const Center(child: Text('Image not found')),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text('Rs ${price.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
  // Helper to build "Why Choose Us" Card
    Widget _buildWhyChooseSection(BuildContext context, bool isWide) {
      final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
       alignment: WrapAlignment.center, // Center the items
       spacing: isPortrait ? 20 : 40,  // Horizontal spacing between items 
        runSpacing: 20, // Vertical spacing between rows
            children: [                                         
              _buildWhyChooseUsCard(
                Icons.check_circle,
                '100% Authentic',
                'Products from Trusted Sellers',
              ),
              _buildWhyChooseUsCard(
                Icons.delivery_dining,
                'Islandwide Delivery',
                'Quick and Secure within 1-3 days',
              ),
               _buildWhyChooseUsCard(
                Icons.payment, 
                'Easy Payment Options', 
                'Convenient installment plans',
              ),
                  _buildWhyChooseUsCard(
                 Icons.star,
                 'Trusted Online Store',
                 '10,000+ customers since 2015',
              ),
            ],
          ),
    );
  }

  // Why Choose Us Card
  Widget _buildWhyChooseUsCard(IconData icon, String title, String subtitle) {
    return Container(
      width: 150, //setting a fixed width for cards
      child: Column(
      children: [
        Icon(icon, size: 40, color: Colors.pink),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
      ),
    );
  }

  // Drawer Item
  Widget _buildDrawerItem(IconData icon, String title, String route, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}