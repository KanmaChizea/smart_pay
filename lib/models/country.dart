// ignore_for_file: public_member_api_docs, sort_constructors_first
class Country {
  final String name;
  final String flagUrl;
  final String code;
  Country({
    required this.name,
    required this.flagUrl,
    required this.code,
  });

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name']['common'] as String,
      flagUrl: map['flags']['svg'] as String,
      code: map['cca2'] as String,
    );
  }

  @override
  bool operator ==(covariant Country other) {
    if (identical(this, other)) return true;

    return other.name == name && other.flagUrl == flagUrl && other.code == code;
  }

  @override
  int get hashCode => name.hashCode ^ flagUrl.hashCode ^ code.hashCode;
}
