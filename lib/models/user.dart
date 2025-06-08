class User {
  final int? id;
  final String name;
  final String email;
  final String? token; // optional

  User({
    this.id,
    required this.name,
    required this.email,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json, {String? token}) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      token: token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }
}
