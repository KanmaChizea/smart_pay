import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/core/cubits/theme_cubit.dart';

class ThemeController extends StatelessWidget {
  const ThemeController({super.key});

  @override
  Widget build(BuildContext context) {
    List<({ThemeMode mode, String text})> themes = [
      (mode: ThemeMode.system, text: 'System'),
      (mode: ThemeMode.light, text: 'Light'),
      (mode: ThemeMode.dark, text: 'Dark'),
    ];
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1.5,
          color: isDarkMode ? Colors.white : AppColors.grey.shade900,
        ),
      ),
      child: Row(
        children: themes.map((e) {
          final isSelected = e.mode == context.watch<ThemeCubit>().state;
          return Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: isSelected ? AppColors.primary : null),
              child: GestureDetector(
                  onTap: () => context.read<ThemeCubit>().setTheme(e.mode),
                  child: Text(
                    e.text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isSelected ? Colors.white : null,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500),
                  )),
            ),
          );
        }).toList(),
      ),
    );
  }
}
