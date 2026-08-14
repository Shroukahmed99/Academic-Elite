import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/strings_manager.dart';
import 'package:academic_elite/core/utils/styles_manager.dart';
import 'package:academic_elite/features/splash/presentation/widgets/splash_progress_bar.dart';
import 'package:flutter/material.dart';

class SplashLoadingSection extends StatelessWidget {
  final Animation<double> progressAnimation;

  const SplashLoadingSection({
    super.key,
    required this.progressAnimation,
  });

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return Positioned(
      left: AppSizes.p14,
      right: AppSizes.p14,
      bottom: AppSizes.h(82),
      child: AnimatedBuilder(
        animation: progressAnimation,
        builder: (context, child) {
          final progress = (progressAnimation.value * 100).round();

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: StringsManager.loading,
                    style: StylesManager.whiteRegular12,
                  ),
                  CustomText(
                    text: '$progress%',
                    style: StylesManager.whiteBold12,
                  ),
                ],
              ),
              SizedBox(height: AppSizes.h(6)),
              SplashProgressBar(
                progress: progressAnimation.value,
              ),
            ],
          );
        },
      ),
    );
  }
}