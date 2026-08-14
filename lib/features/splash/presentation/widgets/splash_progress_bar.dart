import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class SplashProgressBar extends StatelessWidget {
  final double progress;

  const SplashProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return Container(
      width: double.infinity,
      height: AppSizes.h(11),
      padding: EdgeInsets.all(AppSizes.r(2)),
      decoration: BoxDecoration(
        color: ColorsManager.font6,
        borderRadius: BorderRadius.circular(AppSizes.r(10)),
      ),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: FractionallySizedBox(
          widthFactor: progress,
          child: Container(
            decoration: BoxDecoration(
              color: ColorsManager.secondary,
              borderRadius: BorderRadius.circular(AppSizes.r(8)),
            ),
          ),
        ),
      ),
    );
  }
}