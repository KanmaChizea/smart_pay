import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/presentation/screens/registration/initiate_registration_view_model.dart';
import 'package:smart_pay/presentation/widgets/appbar.dart';
import 'package:smart_pay/presentation/widgets/forms/initiate_registration_form.dart';
import 'package:smart_pay/presentation/widgets/link_text.dart';
import 'package:smart_pay/presentation/widgets/third_party_auth.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';

class InitiateRegistration extends StatelessWidget {
  const InitiateRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitiateRegistrationViewModel(),
      child: Builder(
        builder: (context) {
          final viewModel = context.read<InitiateRegistrationViewModel>();
          return Scaffold(
            appBar: CustomAppbar(),
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: AppSpacing.screenPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '',
                            style: Theme.of(context).textTheme.headlineMedium,
                            children: const [
                              TextSpan(text: 'Create a '),
                              TextSpan(
                                  text: 'Smartpay\n',
                                  style: TextStyle(color: AppColors.primary)),
                              TextSpan(text: 'account'),
                            ],
                          ),
                        ),
                        AppSpacing.space(32),
                        const InitiateRegistrationForm(),
                        const ThirdPartyAuthWidget(),
                        Expanded(
                          child: LinkText(
                            link: 'Sign In',
                            text: 'Already have an account? ',
                            onPressed: viewModel.goBack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
