class UserModel {
  final String name;
  final String username;
  final String email;
  final String city;

  UserModel({
    required this.name,
    required this.username,
    required this.email,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      city: json['address']?['city'] ?? '',
    );
  }
}