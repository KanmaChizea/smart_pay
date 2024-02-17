import 'package:flutter/material.dart';
import 'package:smart_pay/presentation/screens/Onboarding/onboarding.dart';
import 'package:smart_pay/presentation/screens/dashboard/dashboard.dart';
import 'package:smart_pay/presentation/screens/forgot_password/new_password.dart';
import 'package:smart_pay/presentation/screens/forgot_password/password_recovery.dart';
import 'package:smart_pay/presentation/screens/forgot_password/verification.dart';
import 'package:smart_pay/presentation/screens/login/login.dart';
import 'package:smart_pay/presentation/screens/registration/intitiate_registration.dart';
import 'package:smart_pay/presentation/screens/registration/personal_info.dart';
import 'package:smart_pay/presentation/screens/registration/set_pin.dart';
import 'package:smart_pay/presentation/screens/registration/verify_email.dart';
import 'package:smart_pay/presentation/screens/success/success.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name;
    final builder = getRouteWidget(settings)[routeName];
    if (builder != null) {
      return MaterialPageRoute(
        builder: builder,
        settings: settings,
      );
    } else {
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('PAGE NOT FOUND'),
          ),
        ),
        settings: settings,
      );
    }
  }

  /// Returns a map of all the routes in the app.
  static Map<String, WidgetBuilder> getRouteWidget(RouteSettings settings) => {
        '/': (_) => const OnboardingScreen(),
        '/login': (_) => const LoginScreen(),
        '/start_registration': (_) => const InitiateRegistration(),
        '/verify_email': (_) => VerifyEmail(
              email: settings.arguments as String,
            ),
        '/personal_info': (_) => PersonalInfo(
              email: settings.arguments as String,
            ),
        '/set_pin': (_) => SetPin(
              name: settings.arguments as String,
            ),
        '/success': (_) {
          final params = settings.arguments as ({
            String title,
            String text,
            String buttonText,
            Function() buttonFunction
          });
          return SuccessScreen(
              title: params.title,
              text: params.text,
              buttonText: params.buttonText,
              buttonFunction: params.buttonFunction);
        },
        '/forgot_password': (_) => const PasswordRecovery(),
        '/verify_identity': (_) => VerifyIdentity(
              email: settings.arguments as String,
            ),
        '/new_password': (_) => const CreateNewPassword(),
        '/dashboard': (_) => const Dashboard()
      };
}
