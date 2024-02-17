import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_pay/theme/colors.dart';

enum PinInputDecorationType { filled, underline }

class PinInput extends StatelessWidget {
  const PinInput(
      {required this.controller,
      required this.decorationType,
      this.onChange,
      super.key});
  final TextEditingController controller;
  final PinInputDecorationType decorationType;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 5,
      controller: controller,
      readOnly: true,
      useNativeKeyboard: false,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      showCursor: decorationType == PinInputDecorationType.underline,
      obscureText: decorationType == PinInputDecorationType.underline,
      obscuringCharacter: '\u25CF',
      onChanged: onChange,
      defaultPinTheme: PinTheme(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: decorationType == PinInputDecorationType.filled
              ? AppColors.grey.shade200
              : Colors.transparent,
          borderRadius: decorationType == PinInputDecorationType.filled
              ? BorderRadius.circular(12)
              : null,
          border: decorationType == PinInputDecorationType.filled
              ? null
              : const Border(
                  bottom: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: decorationType == PinInputDecorationType.filled
              ? AppColors.grey.shade200
              : Colors.transparent,
          borderRadius: decorationType == PinInputDecorationType.filled
              ? BorderRadius.circular(12)
              : null,
          border: decorationType == PinInputDecorationType.filled
              ? Border.all(
                  color: AppColors.primary.shade400,
                )
              : const Border(
                  bottom: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
        ),
      ),
    );
  }
}
