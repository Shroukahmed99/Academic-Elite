import 'package:academic_elite/core/components/custom_button.dart';
import 'package:academic_elite/core/extensions/localization_extension.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class OnboardingNavigation extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnboardingNavigation({
    super.key,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p16),
      child: Row(
        textDirection: Directionality.of(context),
        children: [
          Expanded(
            flex: 7,
            child: CustomButton(
              text: context.l10n.continueText,
              onPressed: onNext,
              height: 50,
              borderRadius: 24,
              textStyle: context.textTheme.labelLarge!,
              suffixIcon: Icon(
                context.isArabic ? Icons.arrow_forward : Icons.arrow_back,
                color: ColorsManager.white,
                size: AppSizes.sp(20),
              ),
            ),
          ),
          SizedBox(width: AppSizes.w(10)),
          Expanded(
            flex: 3,
            child: CustomButton.outlined(
              text: context.l10n.skip,
              onPressed: onSkip,
              height: 50,
              borderRadius: 24,
              borderColor: ColorsManager.font4,
              textColor: ColorsManager.font1,
              textStyle: context.textTheme.labelLarge!.copyWith(
                color: ColorsManager.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
