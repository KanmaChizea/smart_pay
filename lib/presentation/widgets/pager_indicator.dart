import 'package:flutter/material.dart';
import 'package:smart_pay/theme/colors.dart';

class PagerIndicator extends StatelessWidget {
  const PagerIndicator(
      {required this.currentPage, required this.pageLength, super.key});
  final int currentPage;
  final int pageLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < pageLength; i++)
          Container(
            height: 6,
            width: i == currentPage ? 32 : 6,
            margin: const EdgeInsets.fromLTRB(2, 16, 2, 36),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: i == currentPage
                    ? AppColors.grey.shade900
                    : AppColors.grey.shade200),
          )
      ],
    );
  }
}
