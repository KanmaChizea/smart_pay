import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_pay/theme/spacing.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({required this.secretMessage, super.key});
  final String secretMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'lib/assets/svgs/logo.svg',
                    width: 32,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('LOG OUT'),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Text(
                    secretMessage,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
