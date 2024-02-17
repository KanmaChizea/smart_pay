import 'package:flutter/material.dart';
import 'package:smart_pay/main.dart';
import 'package:smart_pay/presentation/widgets/appbar.dart';
import 'package:smart_pay/presentation/widgets/inputs/form_field.dart';
import 'package:smart_pay/presentation/widgets/screens/forgot_password_screen.dart';
import 'package:smart_pay/utils/validator.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  late TextEditingController controller;
  final formKey = GlobalKey<FormState>();
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
    return Scaffold(
      appBar: CustomAppbar(),
      body: ForgotPasswordScreen(
        assetPath: 'lib/assets/svgs/lock.svg',
        title: 'Passsword Recovery',
        text:
            'Enter your registered email below to receive password instructions',
        buttonText: 'Send me email',
        buttonFunction: () {
          if (formKey.currentState!.validate()) {
            navigatorKey.currentState?.pushNamed(
              '/verify_identity',
              arguments: controller.text,
            );
          }
        },
        child: Form(
          key: formKey,
          child: InputField(
            hint: 'Email',
            controller: controller,
            validator: Validator.email,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ),
    );
  }
}
