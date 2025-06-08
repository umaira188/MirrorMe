class Product {
  final String? id;
  final String name;
  final String description;
  final String imagePath;
  final String color;
  final double price;
  final int stockQuantity;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.color,
    required this.price,
    required this.stockQuantity,
  });


  // Factory method to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? json['id']?.toString(), // Handle MongoDB (_id) and SQL (id)
      name: json['Name'],
      description: json['Description'],
      imagePath: json['ImagePath'],
      color: json['Color'],
      price: double.tryParse(json['Price'].toString()) ?? 0.0,
      stockQuantity: int.tryParse(json['stockQuantity'].toString()) ?? 0,
    );
  }

  // Convert Product to JSON for POST/PUT
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Description': description,
      'ImagePath': imagePath,
      'Color': color,
      'Price': price,
      'stockQuantity': stockQuantity,
    };
  }
}

