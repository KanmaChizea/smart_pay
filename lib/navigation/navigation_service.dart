import 'package:flutter/material.dart';

class NavigationService {
  const NavigationService({
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  BuildContext get context => navigatorKey.currentContext!;

  /// Method to navigate push ontop the navigate stack a new view.
  ///
  /// this [routeName] will be the route name of the widget,
  /// which must have been registered at [AppRoutes].
  ///
  Future<T?>? navigate<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Method to navigate push ontop the navigate stack a new view.
  ///
  /// this [routeName] will be the route name of the widget,
  /// which must have been registered at [AppRoutes].
  Future<T?>? replace<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  /// Removes the current route.
  ///
  /// [result] is a value that can be sent to the previous screen.
  void goBack<T extends Object?>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }

  /// Clear the stack and show a route.
  ///
  /// [routeName] will be the route name of the widget,
  ///
  /// which must have been registered at [AppRoutes].
  ///
  /// [result] is a value that can be sent to the next screen.
  ///
  Future<T?>? resetWith<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (_) => false,
      arguments: arguments,
    );
  }

  /// Clear the stack until specific route and show a route.
  ///
  /// [routeName] will be the route name of the widget,
  ///
  /// [destinationRouteName] will be the route name of widget to pop till
  /// which must have been registered at [AppRoutes].
  ///
  ///
  Future<T?>? navigateAndPopUntil<T extends Object?>(
    String destinationRouteName,
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(destinationRouteName),
      arguments: arguments,
    );
  }
}
