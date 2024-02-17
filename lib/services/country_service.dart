import 'package:dio/dio.dart';
import 'package:smart_pay/models/country.dart';

abstract class ICountryService {
  Future<List<Country>> getCountrys();
}

class CountryService implements ICountryService {
  @override
  Future<List<Country>> getCountrys() async {
    try {
      final response = await Dio()
          .get('https://restcountries.com/v3.1/all?fields=name,flags,cca2');
      final countryList =
          (response.data as List).map((e) => Country.fromMap(e)).toList();
      countryList.sort((a, b) => a.name.compareTo(b.name));
      return countryList;
    } catch (_) {
// handle error
      return [];
    }
  }
}
