import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/extensions/buttons.dart';
import 'package:smart_pay/models/viewmodel_state.dart';

import 'package:smart_pay/presentation/screens/registration/initiate_registration_view_model.dart';
import 'package:smart_pay/presentation/widgets/inputs/form_field.dart';
import 'package:smart_pay/utils/validator.dart';

class InitiateRegistrationForm extends StatefulWidget {
  const InitiateRegistrationForm({super.key});

  @override
  State<InitiateRegistrationForm> createState() =>
      _InitiateRegistrationFormState();
}

class _InitiateRegistrationFormState extends State<InitiateRegistrationForm> {
  late TextEditingController controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitiateRegistrationViewModel, ViewModelState>(
      builder: (context, state) {
        final viewModel = context.read<InitiateRegistrationViewModel>();
        return Form(
          key: _formKey,
          child: Column(
            children: [
              InputField(
                hint: 'Email',
                controller: controller,
                keyboardType: TextInputType.emailAddress,
                validator: Validator.email,
                onChanged: viewModel.onEditEmail,
              ),
              ElevatedButton(
                onPressed: state.buttonEnabled
                    ? () {
                        if (!_formKey.currentState!.validate()) return;
                        viewModel.submit(controller.text);
                      }
                    : null,
                child: const Text('Sign up'),
              ).withLoader(state.loading)
            ],
          ),
        );
      },
    );
  }
}
