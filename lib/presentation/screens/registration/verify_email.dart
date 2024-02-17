import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pay/core/extensions/buttons.dart';
import 'package:smart_pay/presentation/screens/registration/verify_email_view_model.dart';
import 'package:smart_pay/presentation/widgets/appbar.dart';
import 'package:smart_pay/presentation/widgets/inputs/pin_input.dart';
import 'package:smart_pay/presentation/widgets/screens/screen_with_keypad.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';
import 'package:smart_pay/utils/formatter.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({required this.email, super.key});
  final String email;

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
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
      create: (context) => VerifyEmailViewModel(),
      child: Builder(
        builder: (context) {
          return Scaffold(
              key: UniqueKey(),
              appBar: CustomAppbar(),
              body: ScreenWithKeypad(
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
                                'Verify it’s you',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              AppSpacing.space(8),
                              Text(
                                'We sent a code to ( ${Formatter.hashEmail(widget.email)} ). Enter it here to verify your identity',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(color: AppColors.grey),
                              ),
                              AppSpacing.space(32),
                              PinInput(
                                controller: controller,
                                decorationType: PinInputDecorationType.filled,
                                onChange: context
                                    .read<VerifyEmailViewModel>()
                                    .onCodeEdit,
                              ),
                              AppSpacing.space(32),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: context
                                                .watch<VerifyEmailViewModel>()
                                                .state
                                                .data >
                                            0
                                        ? null
                                        : context
                                            .read<VerifyEmailViewModel>()
                                            .resendCode,
                                    child: const Text('Resend code '),
                                  ),
                                  if (context
                                          .watch<VerifyEmailViewModel>()
                                          .state
                                          .data >
                                      0)
                                    Text(
                                      '${context.watch<VerifyEmailViewModel>().state.data} secs',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.grey.shade400,
                                          ),
                                    ),
                                ],
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: controller.text.length < 5
                                    ? null
                                    : () => context
                                        .read<VerifyEmailViewModel>()
                                        .submit(widget.email, controller.text),
                                child: const Text('Confirm'),
                              ).withLoader(context
                                  .watch<VerifyEmailViewModel>()
                                  .state
                                  .loading),
                              AppSpacing.space(32),
                            ],
                          ),
                        ),
                      )
                    ],
                  )));
        },
      ),
    );
  }
}
