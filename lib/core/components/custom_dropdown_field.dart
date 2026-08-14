import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.controller,
    required this.items,
    this.hintText,
    this.enabled = true,
    this.prefixIcon,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? hintText;
  final List<String> items;
  final bool enabled;
  final Widget? prefixIcon;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: controller.text.isEmpty ? null : controller.text,
      isExpanded: true,
      menuMaxHeight: AppSizes.h(220),
      dropdownColor: ColorsManager.background,
      onChanged: enabled
          ? (value) {
              if (value == null) return;

              controller.text = value;
              onChanged?.call(value);
            }
          : null,
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: ColorsManager.font2,
        size: AppSizes.sp20,
      ),
      style: StylesManager.font1Medium14,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: StylesManager.font3Regular14,
        filled: true,
        fillColor: enabled
            ? ColorsManager.background
            : ColorsManager.font6,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.p16,
          vertical: AppSizes.h(16),
        ),
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(
          minWidth: AppSizes.w40,
          minHeight: AppSizes.h40,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
          borderSide: const BorderSide(
            color: ColorsManager.font5,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
          borderSide: const BorderSide(
            color: ColorsManager.primary,
            width: 1.4,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
          borderSide: const BorderSide(
            color: ColorsManager.font5,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
          borderSide: const BorderSide(
            color: ColorsManager.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
          borderSide: const BorderSide(
            color: ColorsManager.red,
            width: 1.4,
          ),
        ),
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: CustomText(
                text: item,
                style: StylesManager.font1Regular14,
                textAlign: TextAlign.start,
              ),
            ),
          )
          .toList(),
    );
  }
}