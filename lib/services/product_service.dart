import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/product.dart';

class ProductService {
  final String baseUrl = 'http://192.168.8.137:8000/api';
  final storage = const FlutterSecureStorage();

  // Get all products
Future<List<Product>> fetchProducts() async {
  final response = await http.get(
    Uri.parse('$baseUrl/products'),
    headers: {
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final body = json.decode(response.body);

    // ✅ Extract from 'products' key
    final List productList = body['products'] ?? [];

    return productList.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}



  // Add a new product
  Future<bool> addProduct(Product product) async {
    final token = await storage.read(key: 'token');
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: json.encode(product.toJson()),
    );

    return response.statusCode == 201 || response.statusCode == 200;
  }

  // Update product by ID
  Future<bool> updateProduct(String id, Product product) async {
    final token = await storage.read(key: 'token');
    final response = await http.put(
      Uri.parse('$baseUrl/products/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: json.encode(product.toJson()),
    );

    return response.statusCode == 200;
  }

  // Delete a product
  Future<bool> deleteProduct(String id) async {
    final token = await storage.read(key: 'token');
    final response = await http.delete(
      Uri.parse('$baseUrl/products/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    return response.statusCode == 200;
  }

  // Get a product by ID (optional, for detailed edit view)
  Future<Product?> fetchProductById(String id) async {
    final token = await storage.read(key: 'token');
    final response = await http.get(
      Uri.parse('$baseUrl/products/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    }
    return null;
  }
}
