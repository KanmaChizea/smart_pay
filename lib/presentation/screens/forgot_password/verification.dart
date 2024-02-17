import 'package:flutter/material.dart';
import 'package:smart_pay/main.dart';
import 'package:smart_pay/presentation/widgets/appbar.dart';
import 'package:smart_pay/presentation/widgets/screens/forgot_password_screen.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';
import 'package:smart_pay/utils/formatter.dart';

class VerifyIdentity extends StatelessWidget {
  const VerifyIdentity({required this.email, super.key});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: ForgotPasswordScreen(
        assetPath: 'lib/assets/svgs/person.svg',
        title: 'Verify your identity',
        subTitle: RichText(
          text: TextSpan(
            text: '',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.apply(color: AppColors.grey),
            children: const [
              TextSpan(text: 'Where would you like '),
              TextSpan(
                text: 'Smartpay ',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(text: 'to send your security code?'),
            ],
          ),
        ),
        text: 'Where would you like Smartpay to send your security code?',
        buttonText: 'Continue',
        buttonFunction: () =>
            navigatorKey.currentState?.pushNamed('/new_password'),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.grey.shade50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.check_circle,
                size: 20,
                color: AppColors.primary,
              ),
              AppSpacing.space(18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  AppSpacing.space(4),
                  Text(
                    Formatter.hashEmail(email, 1),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.email_outlined,
                color: AppColors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
