import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/presentation/screens/Onboarding/view_model.dart';
import 'package:smart_pay/presentation/widgets/pager_indicator.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';

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
                    onPressed: context.read<OnboardingViewModel>().goToLogin,
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
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(e.imageUrl),
                                ),
                              ),
                              AppSpacing.space(46),
                              Text(
                                e.title,
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              AppSpacing.space(16),
                              Text(
                                e.text,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: AppColors.grey),
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
                  onPressed: context.read<OnboardingViewModel>().goToLogin,
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
