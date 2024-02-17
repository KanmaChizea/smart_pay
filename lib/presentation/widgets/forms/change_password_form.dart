import 'package:flutter/material.dart';
import 'package:smart_pay/main.dart';
import 'package:smart_pay/presentation/widgets/inputs/password_input.dart';
import 'package:smart_pay/utils/validator.dart';

class ChangePassworForm extends StatefulWidget {
  const ChangePassworForm({super.key});

  @override
  State<ChangePassworForm> createState() => _ChangePassworFormState();
}

class _ChangePassworFormState extends State<ChangePassworForm> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PasswordInput(
            controller: passwordController,
            validator: Validator.strongPassword,
          ),
          PasswordInput(
            hint: 'Confirm password',
            controller: confirmPasswordController,
            validator: (val) => Validator.sameAs(
              val,
              passwordController.text,
              'Passwords dont match',
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                navigatorKey.currentState?.pushNamedAndRemoveUntil(
                  '/success',
                  (route) => route.settings.name == '/login',
                  arguments: (
                    title: 'Password Reset Successful',
                    text:
                        'You’ve successfully changed your password. You can now sign in with new credentials',
                    buttonText: 'Go to Login',
                    buttonFunction: () => navigatorKey.currentState!.pop(),
                  ),
                );
              }
            },
            child: const Text('Create new password'),
          )
        ],
      ),
    );
  }
}
