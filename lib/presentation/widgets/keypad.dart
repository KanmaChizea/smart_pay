import 'package:flutter/material.dart';
import 'package:smart_pay/theme/colors.dart';

class PinKeypad extends StatelessWidget {
  const PinKeypad({required this.controller, super.key});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final keys = [1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, 'DEL'];
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 56,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (keys[index] == 'DEL') {
              if (controller.text.isNotEmpty) {
                controller.text =
                    controller.text.substring(0, controller.text.length - 1);
              }
              return;
            }
            if (controller.text.length <= 5) {
              controller.text = '${controller.text}${keys[index]}';
              return;
            }
          },
          splashColor: AppColors.grey.shade200,
          highlightColor: AppColors.grey.shade50,
          child: Container(
            alignment: Alignment.center,
            child: keys[index] == 'DEL'
                ? const Icon(
                    Icons.backspace_outlined,
                    size: 28,
                  )
                : Text(
                    keys[index].toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
          ),
        );
      },
      itemCount: keys.length,
    );
  }
}
