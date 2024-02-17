import 'package:flutter/material.dart';
import 'package:smart_pay/presentation/widgets/inputs/form_field.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput(
      {required this.controller,
      this.validator,
      this.onChanged,
      this.hint,
      super.key});
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? hint;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return InputField(
      hint: widget.hint ?? 'Password',
      controller: widget.controller,
      obscureText: obscureText,
      validator: widget.validator,
      onChanged: widget.onChanged,
      suffixIcon: IconButton(
        onPressed: () => setState(() {
          obscureText = !obscureText;
        }),
        icon: Icon(obscureText
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined),
      ),
    );
  }
}
