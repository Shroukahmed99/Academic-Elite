import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class AccountSwitchButton extends StatelessWidget {
  const AccountSwitchButton({
    super.key,
    required this.leadingText,
    required this.actionText,
    required this.onPressed,
  });

  final String leadingText;
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(
        AppSizes.r(24),
      ),
      child: Container(
        width: double.infinity,
        height: AppSizes.h(50),
        decoration: BoxDecoration(
          color: ColorsManager.background,
          borderRadius: BorderRadius.circular(
            AppSizes.r(24),
          ),
          border: Border.all(
            color: ColorsManager.font4,
            width: AppSizes.w(1),
          ),
        ),
        alignment: Alignment.center,
        child: RichText(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: leadingText,
                style: context.textTheme.labelSmall!,
              ),

              const TextSpan(
                text: '   ',
              ),

              TextSpan(
                text: actionText,
                style: context.textTheme.labelMedium!.copyWith(
                  color: ColorsManager.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorsManager.primary,
                  decorationThickness: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}