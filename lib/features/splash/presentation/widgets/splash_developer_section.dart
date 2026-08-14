import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/core/utils/strings_manager.dart';
import 'package:academic_elite/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashDeveloperSection extends StatelessWidget {
  const SplashDeveloperSection({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return Positioned(
      left: AppSizes.p14,
      right: AppSizes.p14,
      bottom: AppSizes.h(18),
      child: Container(
        height: AppSizes.h(38),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.p12,
        ),
        decoration: BoxDecoration(
          color: ColorsManager.font1.withValues(alpha: 0.45),
          borderRadius: BorderRadius.circular(AppSizes.r20),
          border: Border.all(
            color: ColorsManager.font4,
            width: 0.8,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: StringsManager.developedBy,
              style: StylesManager.whiteBold12,
            ),
            SizedBox(width: AppSizes.w(6)),
            SizedBox(
              width: AppSizes.w(38),
              height: AppSizes.h(22),
              child: SvgPicture.asset(
                AssetsManager.logoDeveloperSvg,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}