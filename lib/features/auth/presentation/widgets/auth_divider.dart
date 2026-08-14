import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: AppSizes.h(1),
            color: ColorsManager.secondary20,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.p4,
          ),
          child: Container(
            width: AppSizes.w(4),
            height: AppSizes.h(4),
            decoration: const BoxDecoration(
              color: ColorsManager.secondary,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: AppSizes.h(1),
            color: ColorsManager.secondary20,
          ),
        ),
      ],
    );
  }
}