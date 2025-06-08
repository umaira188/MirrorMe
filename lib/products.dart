import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../services/product_service.dart'; // Make sure this exists
import '../models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductService _productService = ProductService();
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final connectivity = await Connectivity().checkConnectivity();

    try {
      if (connectivity != ConnectivityResult.none) {
        final onlineProducts = await _productService.fetchProducts();
        setState(() {
          products = onlineProducts;
        });
        return;
      }
    } catch (_) {}

    // Fallback to local file
    final localJson = await rootBundle.loadString('assets/products.json');
    final List<dynamic> localData = json.decode(localJson);
    setState(() {
      products = localData.map((item) => Product.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount;
                double childAspectRatio;
                bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

                if (constraints.maxWidth < 600) {
                  crossAxisCount = isPortrait ? 2 : 3;
                  childAspectRatio = isPortrait ? 0.7 : 1.2;
                } else if (constraints.maxWidth < 900) {
                  crossAxisCount = isPortrait ? 3 : 4;
                  childAspectRatio = isPortrait ? 1.0 : 1.2;
                } else {
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
                        Navigator.pushNamed(context, '/description', arguments: product);
                      },
                      child: Card(
                        elevation: 2,
                        child: Column(
                          children: [
                            Expanded(
                              child: Hero(
                                tag: product.id ?? index.toString(),
                                child: Image.network(
                                  product.imagePath ?? '',
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product.name ?? 'No name',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text('Rs ${product.price?.toStringAsFixed(2) ?? '0.00'}'),
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
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.pink.shade200,
      elevation: 0,
      title: Row(
        children: [
          Image.asset('Assets/images/LOGO.jpg', height: 40),
          const SizedBox(width: 10),
          const Text('MIRROR ME', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.black)),
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
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.pink.shade200),
            child: Column(
              children: [
                Image.asset('assets/images/LOGO.jpg', height: 60),
                const SizedBox(height: 10),
                const Text('Mirror Me', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          _drawerItem(Icons.home, 'Home', '/home'),
          _drawerItem(Icons.grid_view, 'Products', '/products'),
          _drawerItem(Icons.favorite_border, 'Wishlist', '/wishlist'),
          _drawerItem(Icons.person, 'Profile', '/profile'),
          _drawerItem(Icons.shopping_cart, 'Cart', '/cart'),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 1)],
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
    );
  }

  BottomAppBar _buildBottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.pink.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MediaQuery.of(context).orientation == Orientation.portrait
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.spaceEvenly,
          children: [
            _bottomNavItem(context, Icons.home, '/home'),
            _bottomNavItem(context, Icons.grid_view, '/products'),
            _bottomNavItem(context, Icons.favorite, '/wishlist'),
            _bottomNavItem(context, Icons.person, '/profile'),
          ],
        ),
      ),
    );
  }

  IconButton _bottomNavItem(BuildContext context, IconData icon, String route) {
    return IconButton(
      icon: Icon(icon, color: Colors.black),
      onPressed: () => Navigator.pushNamed(context, route),
    );
  }
}
