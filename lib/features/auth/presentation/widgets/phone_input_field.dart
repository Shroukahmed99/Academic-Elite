import 'package:academic_elite/core/extensions/localization_extension.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneCountry {
  const PhoneCountry({
    required this.name,
    required this.code,
    required this.flag,
  });

  final String name;
  final String code;
  final String flag;
}

class PhoneInputField extends StatefulWidget {
  const PhoneInputField({
    super.key,
    required this.controller,
    this.validator,
    this.onCountryChanged,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final ValueChanged<PhoneCountry>? onCountryChanged;

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  static const List<PhoneCountry> _countries = [
    PhoneCountry(
      name: 'jordan',
      code: '+962',
      flag: AssetsManager.emojioneFlagJordan,
    ),
    PhoneCountry(
      name: 'england',
      code: '+44',
      flag: AssetsManager.emojioneFlagEngland,
    ),
  ];

  late PhoneCountry _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = _countries.first;
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return FormField<String>(
      validator: (_) => widget.validator?.call(widget.controller.text),
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: AppSizes.h(50),
              decoration: BoxDecoration(
                color: ColorsManager.font6,
                borderRadius: BorderRadius.circular(AppSizes.r(16)),

                border: Border.all(
                  color: field.hasError
                      ? ColorsManager.red
                      : ColorsManager.primary,
                  width: AppSizes.w(1.5),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.w(12)),
                    child: Icon(
                      Icons.phone_outlined,
                      size: AppSizes.sp(19),
                      color: ColorsManager.primary,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.right,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.font2,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: context.l10n.phoneHint,
                        hintStyle: context.textTheme.bodyMedium!.copyWith(
                          color: ColorsManager.font2,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSizes.w(12),
                        ),
                      ),
                      onChanged: (value) {
                        field.didChange(value);
                      },
                    ),
                  ),

                  _buildDivider(),
                  _buildCountrySelector(context),
                ],
              ),
            ),

            if (field.hasError)
              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.h(4),
                  right: AppSizes.w(12),
                ),
                child: Text(
                  field.errorText!,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildDivider() {
    return Container(
      width: AppSizes.w(1),
      height: AppSizes.h(30),
      color: ColorsManager.font4,
    );
  }

  Widget _buildCountrySelector(BuildContext context) {
    return PopupMenuButton<PhoneCountry>(
      padding: EdgeInsets.zero,
      tooltip: '',
      onSelected: (country) {
        setState(() {
          _selectedCountry = country;
        });

        widget.onCountryChanged?.call(country);
      },
      itemBuilder: (context) {
        return _countries.map((country) {
          return PopupMenuItem<PhoneCountry>(
            value: country,
            child: Row(
              children: [
                SvgPicture.asset(
                  country.flag,
                  width: AppSizes.w(24),
                  height: AppSizes.h(24),
                ),
                SizedBox(width: AppSizes.w(8)),
                Text(
                  _countryName(context, country.name),
                  style: context.textTheme.bodyMedium,
                ),
                const Spacer(),
                Text(country.code, style: context.textTheme.bodyMedium),
              ],
            ),
          );
        }).toList();
      },
      child: Padding(
        padding: EdgeInsets.only(left: AppSizes.w(12), right: AppSizes.w(8)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              _selectedCountry.flag,
              width: AppSizes.w(24),
              height: AppSizes.h(24),
            ),

            SizedBox(width: AppSizes.w(7)),

            Text(
              _selectedCountry.code,
              style: context.textTheme.bodyMedium!.copyWith(
                color: ColorsManager.font2,
                fontWeight: FontWeight.w400,
              ),
            ),

            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: AppSizes.sp(18),
              color: ColorsManager.primary,
            ),
          ],
        ),
      ),
    );
  }

  String _countryName(BuildContext context, String country) {
    switch (country) {
      case 'jordan':
        return context.l10n.jordan;
      case 'england':
        return context.l10n.england;
      default:
        return country;
    }
  }
}
