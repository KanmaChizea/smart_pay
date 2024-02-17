import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final String assetPath;
  final String title;
  final String text;
  final Widget child;
  final String buttonText;
  final Function() buttonFunction;
  final Widget? subTitle;
  const ForgotPasswordScreen(
      {required this.assetPath,
      required this.title,
      required this.text,
      required this.child,
      required this.buttonText,
      required this.buttonFunction,
      this.subTitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: AppSpacing.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(assetPath),
                AppSpacing.space(24),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                AppSpacing.space(12),
                subTitle ??
                    Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: AppColors.grey),
                    ),
                AppSpacing.space(32),
                child,
                const Spacer(),
                ElevatedButton(
                  onPressed: buttonFunction,
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
