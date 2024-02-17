import 'package:flutter/material.dart';
import 'package:smart_pay/presentation/animations/shake.dart';
import 'package:smart_pay/theme/colors.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.hint,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    super.key,
  });
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final bool readOnly;
  final Function()? onTap;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    animation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void startShakeAnimation() {
    TickerFuture tickerFuture = animationController.repeat();
    tickerFuture.timeout(const Duration(milliseconds: 500), onTimeout: () {
      animationController.stop(canceled: true);
      animationController.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShakeAnimation(
      animation: animation,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: TextFormField(
          controller: widget.controller,
          validator: (value) {
            if (widget.validator == null) {
              return '';
            }
            final validationError = widget.validator?.call(value);
            if (validationError != null) {
              startShakeAnimation();
            }
            return validationError;
          },
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          cursorColor: AppColors.grey.shade900,
          obscuringCharacter: '\u2B24',
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
          ),
        ),
      ),
    );
  }
}
