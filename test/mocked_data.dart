import 'package:smart_pay/models/country.dart';
import 'package:smart_pay/models/user.dart';

abstract class MockedData {
  static List<Country> countries = [
    Country(name: 'Nigeria', flagUrl: 'www.flag.com', code: 'NG'),
    Country(name: 'Niger', flagUrl: 'www.flag.com', code: 'NI'),
    Country(name: 'Nairobi', flagUrl: 'www.flag.com', code: 'NB'),
  ];

  static User user = User(
      id: 'id',
      fullname: 'fullname',
      username: 'username',
      email: 'email',
      country: 'country');
}
