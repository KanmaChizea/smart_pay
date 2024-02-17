import 'package:flutter/material.dart';
import 'package:smart_pay/presentation/widgets/keypad.dart';

class ScreenWithKeypad extends StatelessWidget {
  final Widget child;
  final TextEditingController controller;
  const ScreenWithKeypad({
    required this.child,
    required this.controller,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: child),
              PinKeypad(controller: controller)
            ],
          );
        } else {
          return Row(
            children: [
              Expanded(child: child),
              Expanded(
                child: PinKeypad(controller: controller),
              )
            ],
          );
        }
      },
    );
  }
}
