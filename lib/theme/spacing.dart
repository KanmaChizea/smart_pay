import 'package:flutter/cupertino.dart';

abstract class AppSpacing {
  static const screenPadding = EdgeInsets.all(24);
  static space(double size) => SizedBox(height: size, width: size);
}
