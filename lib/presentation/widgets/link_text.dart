import 'package:flutter/material.dart';
import 'package:smart_pay/theme/colors.dart';

class LinkText extends StatelessWidget {
  const LinkText(
      {required this.link,
      required this.text,
      required this.onPressed,
      super.key});
  final String text;
  final String link;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(color: AppColors.grey),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            link,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
