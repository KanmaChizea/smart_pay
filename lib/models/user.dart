class User {
  final String id;
  final String fullname;
  final String username;
  final String email;
  final String country;
  final String? phone;
  final String? phoneCountry;
  final String? avatar;
  User({
    required this.id,
    required this.fullname,
    required this.username,
    required this.email,
    required this.country,
    this.avatar,
    this.phone,
    this.phoneCountry,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map['id'] as String,
        fullname: map['full_name'] as String,
        username: map['username'] as String,
        email: map['email'] as String,
        country: map['country'] as String,
        avatar: map['avatar'],
        phone: map['phone'],
        phoneCountry: map['phone_country']);
  }
}
