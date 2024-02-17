import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/dependency_injection/injection_container.dart';
import 'package:smart_pay/models/country.dart';
import 'package:smart_pay/services/country_service.dart';

class CountryCubit extends Cubit<List<Country>> {
  CountryCubit([ICountryService? countryService]) : super([]) {
    initializeCountries();
  }
  final _countriesService = sl.get<ICountryService>();
  late List<Country> country;

  Future<void> initializeCountries() async {
    final countries = await _countriesService.getCountrys();
    country = countries;
    emit(countries);
  }

  void searchCountry(String text) {
    if (text.isEmpty) {
      clearSearch();
    } else {
      emit(country
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList());
    }
  }

  void clearSearch([TextEditingController? controller]) {
    if (controller != null) {
      controller.clear();
    }
    emit(country);
  }
}
