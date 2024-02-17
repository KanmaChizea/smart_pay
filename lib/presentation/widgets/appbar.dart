import 'package:flutter/material.dart';
import 'package:smart_pay/main.dart';
import 'package:smart_pay/theme/colors.dart';

class CustomAppbar extends AppBar {
  CustomAppbar(
      {Widget? title, List<Widget>? actions, Widget? leading, super.key})
      : super(
            leadingWidth: 86,
            leading: leading ??
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey.shade200),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () => navigatorKey.currentState!.pop(),
                    borderRadius: BorderRadius.circular(12),
                    child: const Icon(Icons.chevron_left),
                  ),
                ),
            title: title,
            actions: actions);
}
