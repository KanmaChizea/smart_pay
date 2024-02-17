import 'package:flutter/material.dart';
import 'package:smart_pay/presentation/animations/thumbs_up.dart';

import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';

class SuccessScreen extends StatelessWidget {
  final String title;
  final String text;
  final String buttonText;
  final Function() buttonFunction;
  const SuccessScreen(
      {required this.title,
      required this.text,
      required this.buttonText,
      required this.buttonFunction,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AnimatedThumbsUp(),
            AppSpacing.space(32),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            AppSpacing.space(12),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.apply(color: AppColors.grey),
            ),
            AppSpacing.space(32),
            ElevatedButton(
              onPressed: buttonFunction,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
