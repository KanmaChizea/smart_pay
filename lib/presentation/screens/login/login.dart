import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/presentation/screens/login/view_model.dart';
import 'package:smart_pay/presentation/widgets/appbar.dart';
import 'package:smart_pay/presentation/widgets/forms/login_form.dart';
import 'package:smart_pay/presentation/widgets/link_text.dart';
import 'package:smart_pay/presentation/widgets/third_party_auth.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginViewModel(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: CustomAppbar(),
          body: Padding(
            padding: AppSpacing.screenPadding,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi There! 👋',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      AppSpacing.space(8),
                      Text(
                        'Welcome back, Sign in to your account',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: AppColors.grey),
                      ),
                      AppSpacing.space(32),
                      const LoginForm(),
                      const ThirdPartyAuthWidget(),
                      const Spacer(),
                      LinkText(
                        link: 'Sign up',
                        text: 'Don’t have an account? ',
                        onPressed: context.read<LoginViewModel>().goToSignup,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
