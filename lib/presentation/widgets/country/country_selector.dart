import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:smart_pay/models/country.dart';
import 'package:smart_pay/presentation/widgets/country/country_cubit.dart';
import 'package:smart_pay/presentation/widgets/inputs/form_field.dart';
import 'package:smart_pay/theme/colors.dart';
import 'package:smart_pay/theme/spacing.dart';

class CountrySelector extends StatefulWidget {
  const CountrySelector(
      {required this.selectedCountry, required this.selectCountry, super.key});
  final Country? selectedCountry;
  final Function(Country) selectCountry;

  @override
  State<CountrySelector> createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, List<Country>>(
      builder: (context, countries) {
        final viewModel = context.read<CountryCubit>();
        return Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InputField(
                      hint: 'Search',
                      controller: searchController,
                      onChanged: viewModel.searchCountry,
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                  AppSpacing.space(16),
                  TextButton(
                    onPressed: () => viewModel.clearSearch(searchController),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: AppColors.grey.shade900,
                      ),
                    ),
                  )
                ],
              ),
              countries.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => widget.selectCountry(countries[index]),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color:
                                    countries[index] == widget.selectedCountry
                                        ? AppColors.grey.shade200
                                        : Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.network(
                                    countries[index].flagUrl,
                                    width: 32,
                                    fit: BoxFit.contain,
                                  ),
                                  AppSpacing.space(16),
                                  Text(
                                    countries[index].code,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: AppColors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  AppSpacing.space(16),
                                  Text(
                                    countries[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  const Spacer(),
                                  if (countries[index] ==
                                      widget.selectedCountry)
                                    Icon(
                                      Icons.check,
                                      color: AppColors.primary.shade400,
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: countries.length,
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
