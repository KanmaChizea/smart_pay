import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/main.dart';

//state determines the current page of onboarding carousel
class OnboardingViewModel extends Cubit<int> {
  OnboardingViewModel() : super(0);

  final List<({String imageUrl, String title, String text})> content = [
    (
      imageUrl: 'lib/assets/images/onboarding_1.png',
      title: 'Finance app the safest and most trusted',
      text:
          'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.'
    ),
    (
      imageUrl: 'lib/assets/images/onboarding_2.png',
      title: 'The fastest transaction process only here',
      text:
          'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.'
    ),
  ];

  void goToLogin() {
    navigatorKey.currentState!.pushNamed('/login');
  }

  void updatePage(int index) => emit(index);
}
