import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smart_pay/presentation/widgets/country/country_cubit.dart';
import 'package:smart_pay/services/country_service.dart';

import 'utils/mocked_classes.dart';
import 'utils/mocked_data.dart';

void main() {
  group('Country cubit', () {
    late CountryCubit countryCubit;
    late MockCountryService mockCountryService;

    setUp(() {
      mockCountryService = MockCountryService();
      GetIt.I.registerLazySingleton<ICountryService>(() => mockCountryService);

      //arrange at setup because function is called on initialization
      when(() => mockCountryService.getCountrys())
          .thenAnswer((_) async => MockedData.countries);
      countryCubit = CountryCubit();
    });

    tearDown(() {
      GetIt.I.reset();
      countryCubit.close();
    });

    test('emits countries when initialized', () async {
      when(() => mockCountryService.getCountrys())
          .thenAnswer((_) async => MockedData.countries);
      await countryCubit.initializeCountries();
      expect(countryCubit.state, MockedData.countries);
    });
    test('emits all countries when search is cleared', () {
      countryCubit.clearSearch();
      expect(countryCubit.state, MockedData.countries);
    });

    test('emits filtered countries when search is performed', () {
      countryCubit.searchCountry(MockedData.countries.first.name);
      expect(countryCubit.state, [MockedData.countries.first]);
    });
  });
}
