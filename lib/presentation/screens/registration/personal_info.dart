import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/presentation/screens/registration/personal_info_viewmodel.dart';
import 'package:smart_pay/presentation/widgets/appbar.dart';
import 'package:smart_pay/presentation/widgets/forms/personal_info_form.dart';
import 'package:smart_pay/theme/spacing.dart';

import 'package:smart_pay/theme/colors.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({required this.email, super.key});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalInfoViewModel(),
      child: Scaffold(
        appBar: CustomAppbar(),
        body: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '',
                  style: Theme.of(context).textTheme.headlineMedium,
                  children: const [
                    TextSpan(text: 'Hey there! Tell us a bit\nabout '),
                    TextSpan(
                      text: 'yourself',
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              AppSpacing.space(34),
              PersonalInfoForm(email: email)
            ],
          ),
        ),
      ),
    );
  }
}
