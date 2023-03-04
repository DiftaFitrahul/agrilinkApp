class User {
  final String username;
  final String email;
  final String id;

  User({required this.username, required this.email, required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['body']['email'],
        id: json['body']['id'],
        username: json['body']['username']);
  }
}
