import 'package:flutter/material.dart';
 // For globalCart if needed, but here we just pass data
//  A micro-interaction hero transition, uses Hero widget

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  // A list of sample products
  final List<Map<String, dynamic>> products = const [
    {
      'id': 'p1',
      'name': 'LA Girl PRO.Coverage Foundation',
      'price': 4000.0,
      'image': 'Assets/images/LA Girl PRO.Coverage Foundation.jpg',
      'description': 'A premium high-definition, long-wear foundation that offers a flawless, natural finish. Designed to provide exceptional coverage while feeling lightweight on the skin, this foundation is perfect for creating a smooth and radiant complexion that lasts all day.'
    },
    {
      'id': 'p2',
      'name': 'Beauty Of Joseon Revive Serum',
      'price': 5650.0,
      'image': 'Assets/images/Beauty Of Joseon Revive Serum.jpg',
      'description': 'A deeply nourishing serum formulated with a unique blend of premium herbal extracts to hydrate, rejuvenate, and restore your skin. Enriched with antioxidants and essential nutrients.'
    },
    {
      'id': 'p3',
      'name': 'Swiss Beauty Lipstick',
      'price': 3500.0,
      'image': 'Assets/images/Swiss Beauty Lipstick.jpg',
      'description': 'Richly pigmented, providing a bold and vibrant color payoff in just one swipe. Its luxurious formula delivers high color impact, ensuring your lips stand out effortlessly. Perfect for all-day wear!'
    },
    {
      'id': 'p4',
      'name': 'Chrome & Matte Eyeshadow',
      'price': 6200.0,
      'image': 'Assets/images/Matte Eyeliner.jpg',
      'description': 'Duo Eyeshadow with Matte and Chrome finish. A velvety matte shade for a smooth and seamless base, and a dazzling chrome finish for an extra touch of glamour.'
    },
    {
      'id': 'p5',
      'name': 'Purito Seoul Centella Toner',
      'price': 2950.0,
      'image': 'Assets/images/Purito Seoul Centella Toner.jpg',
      'description': 'PURITOs iconic formula, cherished by skincare enthusiasts, is enriched with the soothing power of Centella Asiatica (Cica) and the deeply hydrating benefits of Panthenol.'
    },
    {
      'id': 'p6',
      'name': 'LA Girl Gel Eyeliner',
      'price': 3300.0,
      'image': 'Assets/images/LA Girl Gel Eyeliner.jpg',
      'description': 'Highly pigmented gel eyeliner delivers intense color payoff in just one stroke, ensuring a bold and dramatic look that lasts all day. Its creamy texture glides on effortlessly.'
    },
     {
      'id': 'p7',
      'name': 'HINCE 9 Color Eyeshadow Palette',
      'price': 5900.0,
      'image': 'Assets/images/LA Girl 9 Color Eyeshadow Palette - Radiate.jpg',
      'description': 'Highly pigmented shades designed to effortlessly complement your everyday style. This versatile shadow palette offers a rich color payoff with a smooth, blendable formula, making it perfect for creating both subtle and dramatic styles.'               
    }, 
     {
      'id': 'p8',
      'name': 'Swiss Beauty Matte Compact Powder',
      'price': 4950.0,
      'image': 'Assets/images/Swiss Beauty Compact Powder.jpg',
      'description': 'Experience the ultimate oil control with this compact powder, designed to keep your skin fresh and shine-free all day long. Enriched with SPF 10 protection.'
     },
     { 
      'id': 'p9',
      'name': 'AIRBRUSH Foundation',
      'price': 7300.0,
      'image': 'Assets/images/AirBrush Finish Foundation.jpg',
      'description': 'Full Coverage| Natural Matte Finish| Water-resistant| Long-lasting Foundation. Water-resistant formula ensures your makeup stays intact, even in humid conditions or light splashes.'               
    }, 
    {
      'id': 'p10',
      'name': 'Shady Slim Brow Pencil',
      'price': 2250.0,
      'image': 'Assets/images/Shady Slim Brow Pencil.jpg',
      'description': 'A versatile pencil and spoolie duo designed to help you achieve perfectly shaped and defined brows. This all-in-one tool is ideal for filling, shaping, and grooming your eyebrows with precision, ensuring a flawless and polished look every time.'               
    }, 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top Navigation Bar with Cart Icon
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
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/cart'); // Navigate to Cart screen
              },
            ),
          ],
        ),
      ),

      //  Navigation Drawer
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
              leading: const Icon(Icons.favorite_border),
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

      //Body content 
        body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

      Expanded(
      child: LayoutBuilder(
  builder: (context, constraints) {
    int crossAxisCount;
    double childAspectRatio;
                        //Determines the Orientation
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    if (constraints.maxWidth < 600) {
      // Small screens (mobile)
      crossAxisCount = isPortrait ? 2 : 3;
      childAspectRatio = isPortrait ? 0.7 : 1.2;
    } else if (constraints.maxWidth < 900) {
      // Medium screens (tablets)
      crossAxisCount = isPortrait ? 3 : 4;
      childAspectRatio = isPortrait ? 1.0 : 1.2;
    } else {
      // Large screens (desktops)
      crossAxisCount = isPortrait ? 4 : 5;
      childAspectRatio = isPortrait ? 1.3 : 1.5;
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              // On tap, go to the description screen, pass product as arguments
              Navigator.pushNamed(context, '/description', arguments: product);
            },
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  Expanded(
                    // Uses a Hero widget for micro-interaction
                    child: Hero(
                      tag: product['id'], // matches in Description screen
                      child: Image.asset(
                        product['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text('Rs ${product['price']}'),
                  const SizedBox(height: 8),
                 ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
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
}
