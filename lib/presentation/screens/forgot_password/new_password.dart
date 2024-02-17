import 'package:flutter/material.dart';
import 'package:smart_pay/presentation/widgets/appbar.dart';
import 'package:smart_pay/presentation/widgets/forms/change_password_form.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'Create New Password',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  AppSpacing.space(8),
                  Text(
                    'Please, enter a new password below different from the previous password',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: AppColors.grey),
                  ),
                  AppSpacing.space(32),
                  const Expanded(
                    child: ChangePassworForm(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
