import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';

class ThirdPartyAuthWidget extends StatelessWidget {
  const ThirdPartyAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacing.space(32),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.grey.shade200.withOpacity(0),
                      AppColors.grey.shade200,
                    ],
                  ),
                ),
              ),
            ),
            Text(
              'OR',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.apply(color: AppColors.grey),
            ),
            Expanded(
              child: Container(
                height: 1,
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.grey.shade200,
                      AppColors.grey.shade200.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        AppSpacing.space(24),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: SvgPicture.asset('lib/assets/svgs/google.svg'),
              ),
            ),
            AppSpacing.space(16),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: SvgPicture.asset('lib/assets/svgs/apple.svg'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
