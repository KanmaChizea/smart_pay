import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/presentation/screens/registration/set_pin_viewmodel.dart';
import 'package:smart_pay/presentation/widgets/appbar.dart';
import 'package:smart_pay/presentation/widgets/inputs/pin_input.dart';
import 'package:smart_pay/presentation/widgets/screens/screen_with_keypad.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';

class SetPin extends StatefulWidget {
  const SetPin({required this.name, super.key});
  final String name;
  @override
  State<SetPin> createState() => _SetPinState();
}

class _SetPinState extends State<SetPin> {
  late TextEditingController controller;

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
    return BlocProvider(
      create: (context) => SetPinViewModel(),
      child: Scaffold(
        appBar: CustomAppbar(),
        body: Builder(builder: (context) {
          return ScreenWithKeypad(
            controller: controller,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: AppSpacing.screenPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Set your PIN code',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        AppSpacing.space(8),
                        Text(
                          'We use state-of-the-art security measures to protect your information at all times',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: AppColors.grey),
                        ),
                        AppSpacing.space(32),
                        PinInput(
                          controller: controller,
                          decorationType: PinInputDecorationType.underline,
                          onChange: context.read<SetPinViewModel>().onCodeEdit,
                        ),
                        AppSpacing.space(32),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: context
                                  .watch<SetPinViewModel>()
                                  .state
                                  .buttonEnabled
                              ? () => context
                                  .read<SetPinViewModel>()
                                  .submit(widget.name)
                              : null,
                          child: const Text('Confirm'),
                        ),
                        AppSpacing.space(32),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
