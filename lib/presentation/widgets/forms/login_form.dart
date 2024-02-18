import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/extensions/buttons.dart';
import 'package:smart_pay/models/viewmodel_state.dart';
import 'package:smart_pay/presentation/screens/login/view_model.dart';
import 'package:smart_pay/presentation/widgets/inputs/form_field.dart';
import 'package:smart_pay/presentation/widgets/inputs/password_input.dart';
import 'package:smart_pay/theme/spacing.dart';
import 'package:smart_pay/utils/validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocBuilder<LoginViewModel, ViewModelState<void>>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(
                hint: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validator.email,
              ),
              PasswordInput(
                controller: passwordController,
                validator: Validator.required,
              ),
              TextButton(
                onPressed: context.read<LoginViewModel>().goToForgotPassword,
                child: const Text('Forgot Password?'),
              ),
              AppSpacing.space(24),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  context
                      .read<LoginViewModel>()
                      .submit(emailController.text, passwordController.text);
                },
                child: const Text('Sign In'),
              ).withLoader(state.loading),
            ],
          );
        },
      ),
    );
  }
}
