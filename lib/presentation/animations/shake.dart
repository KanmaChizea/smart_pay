import 'package:flutter/material.dart';

class ShakeAnimation extends AnimatedWidget {
  const ShakeAnimation({
    required Animation<double> animation,
    required this.child,
    Key? key,
  }) : super(key: key, listenable: animation);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.translate(
      offset: Offset(animation.value, 0),
      child: child,
    );
  }
}
