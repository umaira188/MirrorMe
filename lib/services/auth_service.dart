import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final String baseUrl = 'http://192.168.8.137:8000/api';

  // Create secure storage instance
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  /// LOGIN: Stores token, role, and user ID
  Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];
        final role = data['user']['role'];
        final userId = data['user']['id'];

        // ✅ Store all user session data
        await _secureStorage.write(key: 'token', value: token);
        await _secureStorage.write(key: 'role', value: role);
        await _secureStorage.write(key: 'user_id', value: userId.toString());

        return null; // success
      } else {
        final error = json.decode(response.body);
        return error['message'] ?? 'Login failed';
      }
    } catch (e) {
      return 'An error occurred: $e';
    }
  }

  /// REGISTER: Stores token after successful registration
  Future<String?> register(String name, String email, String password, String confirmPassword) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Accept': 'application/json'},
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': confirmPassword,
          'role': 'user', // or 'admin' if needed
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];
        final role = data['user']['role'];
        final userId = data['user']['id'];

        await _secureStorage.write(key: 'token', value: token);
        await _secureStorage.write(key: 'role', value: role);
        await _secureStorage.write(key: 'user_id', value: userId.toString());

        return null; // success
      } else {
        final error = json.decode(response.body);
        return error['message'] ?? 'Registration failed';
      }
    } catch (e) {
      return 'An error occurred: $e';
    }
  }

  /// READ TOKEN
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'token');
  }

  /// READ ROLE
  Future<String?> getRole() async {
    return await _secureStorage.read(key: 'role');
  }

  /// READ USER ID
  Future<String?> getUserId() async {
    return await _secureStorage.read(key: 'user_id');
  }

  /// LOGOUT: Clear secure storage
  Future<void> logout() async {
    await _secureStorage.deleteAll();
  }
}
