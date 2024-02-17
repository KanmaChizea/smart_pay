import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/cubits/user_cubit.dart';
import 'package:smart_pay/navigation/routes.dart';
import 'package:smart_pay/presentation/widgets/country/country_cubit.dart';
import 'package:smart_pay/theme/theme.dart';
import 'package:smart_pay/theme/theme_cubit.dart';
import 'core/dependency_injection/injection_container.dart' as di;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CountryCubit()),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(create: (_) => UserCubit())
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Smartpay',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: context.watch<ThemeCubit>().state,
          navigatorKey: navigatorKey,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      }),
    );
  }
}
