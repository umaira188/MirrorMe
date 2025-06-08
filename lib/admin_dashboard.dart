import 'package:flutter/material.dart';
import 'package:mirror_me/services/product_service.dart';
import 'package:mirror_me/models/product.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List<Product> products = [];
  final ProductService _productService = ProductService();

  final _formKey = GlobalKey<FormState>();
  String name = '', description = '', price = '', color = '', imagePath = '';
  int stock = 0;

  Future<void> fetchProducts() async {
    final fetched = await _productService.fetchProducts();
    setState(() => products = fetched);
  }

  Future<void> addProduct() async {
  if (_formKey.currentState!.validate()) {
    final product = Product(
      name: name,
      description: description,
      imagePath: imagePath,
      color: color,
      price: double.tryParse(price) ?? 0.0,
      stockQuantity: stock,
    );

    final success = await _productService.addProduct(product);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product added successfully')),
      );
      fetchProducts();
    }
  }
}


  Future<void> deleteProduct(String id) async {
    await _productService.deleteProduct(id);
    fetchProducts();
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffdf0f5),
      appBar: AppBar(
        title: const Text('Mirror Me - Admin Dashboard'),
        backgroundColor: const Color(0xfff3e8f7),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context), icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Add New Product',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Product Name'),
                    onChanged: (val) => name = val,
                    validator: (val) => val!.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Description'),
                    onChanged: (val) => description = val,
                    validator: (val) => val!.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Price'),
                    onChanged: (val) => price = val,
                    validator: (val) => val!.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Color'),
                    onChanged: (val) => color = val,
                    validator: (val) => val!.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Image URL'),
                    onChanged: (val) => imagePath = val,
                    validator: (val) => val!.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Stock Quantity'),
                    keyboardType: TextInputType.number,
                    onChanged: (val) => stock = int.tryParse(val) ?? 0,
                    validator: (val) => val!.isEmpty ? 'Required' : null,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: addProduct, child: const Text('Add Product')),
                  const Divider(height: 40),
                ],
              ),
            ),
            const Text('Product Inventory',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(p.imagePath, height: 50, width: 50),
                    title: Text(p.name),
                    subtitle: Text('${p.description}\nRs ${p.price} | Stock: ${p.stockQuantity}'),
                    trailing: IconButton(
                        onPressed: p.id != null ? () => deleteProduct(p.id!) : null,
                        icon: const Icon(Icons.delete, color: Colors.red)),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
