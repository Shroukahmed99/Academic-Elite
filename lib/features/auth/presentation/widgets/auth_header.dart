import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String description;
  final String? logo;

  const AuthHeader({
    super.key,
    required this.title,
    required this.description,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizes.h(28)),

        SizedBox(
          width: AppSizes.w(120),
          height: AppSizes.h(120),
          child: Image.asset(
            logo ?? AssetsManager.logoPng,
            fit: BoxFit.contain,
          ),
        ),

        SizedBox(height: AppSizes.h(20)),

        CustomText(
          text: title,
          textAlign: TextAlign.center,
          style: context.textTheme.headlineSmall!,
        ),

        SizedBox(height: AppSizes.h(8)),

        CustomText(
          text: description,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium!,
        ),
      ],
    );
  }
}