import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/product.dart';


class CartService {
  final String baseUrl = 'http://192.168.8.137:8000/api';
  final storage = const FlutterSecureStorage();

  Future<bool> addToCart(String productId) async {
  final token = await storage.read(key: 'token');
  final response = await http.post(
    Uri.parse('$baseUrl/cart/add'),
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    body: json.encode({'product_id': productId}),
  );
  return response.statusCode == 200;
}

  Future<List<Product>> getCartItems() async {
    final token = await storage.read(key: 'token');
    final response = await http.get(
      Uri.parse('$baseUrl/cart'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List products = body['products'] ?? [];
      return products.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cart items');
    }
  }
}
