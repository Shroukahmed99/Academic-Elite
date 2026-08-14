import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String image;

  const OnboardingImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.h(300),
      child: Image.asset(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
}