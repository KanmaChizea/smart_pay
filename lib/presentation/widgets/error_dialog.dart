import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_pay/main.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({required this.errorMessage, super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    final contents = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.error_outline,
          size: 50,
          color: AppColors.error,
        ),
        AppSpacing.space(8),
        Text(
          'Error',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        AppSpacing.space(24),
        Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.grey,
              ),
        ),
      ],
    );
    return Platform.isIOS
        ? CupertinoAlertDialog(
            content: contents,
            actions: [
              TextButton(
                onPressed: () => navigatorKey.currentState?.pop(),
                child: const Text('Okay'),
              ),
            ],
          )
        : AlertDialog(
            content: contents,
            actions: [
              TextButton(
                onPressed: () => navigatorKey.currentState?.pop(),
                child: const Text('Okay'),
              ),
            ],
          );
  }
}
