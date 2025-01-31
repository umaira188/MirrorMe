import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for text fields
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back!'),
        backgroundColor: Colors.pink.shade200,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Name Field
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Email Field
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Password Field
            TextField(
              controller: passwordController,
              obscureText: true, // Hides the text for password fields
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Phone Field
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone',
                prefixIcon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Update Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      phoneController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All fields must be filled')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile updated successfully')),
                    );
                  }
                },
                child: const Text(
                  'Update',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // My Orders Section
            const Text(
              'My Orders',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Order List Placeholder
            ListView.builder(
              shrinkWrap: true, // Ensure the list doesn't take infinite space
              physics: const NeverScrollableScrollPhysics(), // Prevent scrolling within the list
              itemCount: 5, // Replace with the number of actual orders
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: ListTile(
                    leading: const Icon(Icons.shopping_bag, color: Colors.pink),
                    title: Text('Order #${index + 1}'),
                    subtitle: const Text('Details about the order'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Action for tapping an order (optional)
                    },
                  ),
                );
              },
            ),
          ],
        ),
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
