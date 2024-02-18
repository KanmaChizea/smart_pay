import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_pay/core/extensions/buttons.dart';
import 'package:smart_pay/models/viewmodel_state.dart';
import 'package:smart_pay/presentation/screens/registration/personal_info_viewmodel.dart';
import 'package:smart_pay/presentation/widgets/country/country_selector.dart';
import 'package:smart_pay/presentation/widgets/inputs/form_field.dart';
import 'package:smart_pay/presentation/widgets/inputs/password_input.dart';
import 'package:smart_pay/utils/validator.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({required this.email, super.key});
  final String email;
  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  late TextEditingController fullnameController;
  late TextEditingController usernameController;
  late TextEditingController countryController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fullnameController = TextEditingController();
    usernameController = TextEditingController();
    countryController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    usernameController.dispose();
    countryController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalInfoViewModel,
        ViewModelState<PersonalInfoViewState>>(
      listener: (context, state) {
        final viewModel = context.read<PersonalInfoViewModel>();
        if (state.data.isBottomSheetOpen) {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            backgroundColor: Colors.white,
            builder: (_) => CountrySelector(
              selectedCountry: state.data.selectedCountry,
              selectCountry: (country) =>
                  viewModel.selectCountry(countryController, country),
            ),
          );
        }
      },
      builder: (context, state) {
        final viewModel = context.read<PersonalInfoViewModel>();
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(
                hint: 'Full name',
                controller: fullnameController,
                validator: Validator.required,
                onChanged: (val) => viewModel.onChangeText(val, 0),
              ),
              InputField(
                hint: 'Username',
                controller: usernameController,
                validator: Validator.required,
                onChanged: (val) => viewModel.onChangeText(val, 1),
              ),
              InputField(
                hint: 'Select Country',
                controller: countryController,
                validator: Validator.required,
                readOnly: true,
                suffixIcon: const Icon(Icons.expand_more),
                onTap: viewModel.openBottomSheet,
                prefixIcon: state.data.selectedCountry == null
                    ? null
                    : Container(
                        margin: const EdgeInsets.only(left: 16, right: 12),
                        child: SvgPicture.network(
                          state.data.selectedCountry!.flagUrl,
                          width: 32,
                          fit: BoxFit.contain,
                        ),
                      ),
              ),
              PasswordInput(
                controller: passwordController,
                onChanged: (val) => viewModel.onChangeText(val, 3),
                validator: Validator.strongPassword,
              ),
              ElevatedButton(
                onPressed: state.buttonEnabled
                    ? () {
                        if (!_formKey.currentState!.validate()) return;
                        viewModel.submit(
                            email: widget.email,
                            fullname: fullnameController.text,
                            username: usernameController.text,
                            password: passwordController.text);
                      }
                    : null,
                child: const Text('Contine'),
              ).withLoader(state.loading)
            ],
          ),
        );
      },
    );
  }
}
