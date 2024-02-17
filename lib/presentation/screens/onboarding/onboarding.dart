import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/presentation/screens/Onboarding/view_model.dart';
import 'package:smart_pay/presentation/widgets/pager_indicator.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';
import 'package:smart_pay/theme/textstyles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingViewModel(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Padding(
            padding: AppSpacing.screenPadding,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Skip'),
                  ),
                ),
                Expanded(
                  child: PageView(
                    onPageChanged:
                        context.read<OnboardingViewModel>().updatePage,
                    children: context
                        .read<OnboardingViewModel>()
                        .content
                        .map(
                          (e) => Column(
                            children: [
                              Expanded(
                                child: Image.asset(e.imageUrl),
                              ),
                              AppSpacing.space(46),
                              Text(
                                e.title,
                                textAlign: TextAlign.center,
                                style: AppTextstyles.heading4,
                              ),
                              AppSpacing.space(16),
                              Text(
                                e.text,
                                textAlign: TextAlign.center,
                                style: AppTextstyles.bodyMedium
                                    .copyWith(color: AppColors.grey),
                              )
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
                PagerIndicator(
                  currentPage: context.watch<OnboardingViewModel>().state,
                  pageLength: 2,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Get started'),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
