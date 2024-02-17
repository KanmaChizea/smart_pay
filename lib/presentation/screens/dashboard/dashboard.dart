import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_pay/core/cubits/user_cubit.dart';
import 'package:smart_pay/models/viewmodel_state.dart';
import 'package:smart_pay/presentation/screens/dashboard/dashboard_viewmodel.dart';
import 'package:smart_pay/presentation/widgets/theme_controller.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardViewModal(),
      child: Scaffold(
        body: BlocBuilder<DashboardViewModal, ViewModelState<String>>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: AppSpacing.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'lib/assets/svgs/logo.svg',
                          width: 32,
                        ),
                        TextButton(
                          onPressed: state.buttonEnabled
                              ? context.read<DashboardViewModal>().logout
                              : null,
                          child: const Text('LOG OUT'),
                        ),
                      ],
                    ),
                    if (state.loading)
                      LinearProgressIndicator(
                        backgroundColor: AppColors.primary.shade100,
                        color: AppColors.primary.shade400,
                      ),
                    AppSpacing.space(24),
                    Text(
                      'Welcome ${context.watch<UserCubit>().state?.firstName},',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          state.data,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    const ThemeController(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
