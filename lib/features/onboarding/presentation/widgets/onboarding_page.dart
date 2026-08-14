import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/features/onboarding/data/model/onboarding_model.dart';
import 'package:academic_elite/features/onboarding/presentation/widgets/onboarding_image.dart';
import 'package:academic_elite/features/onboarding/presentation/widgets/onboarding_text.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel item;

  const OnboardingPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.p16,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: AppSizes.h(28)),

            OnboardingImage(
              image: item.image,
            ),

            SizedBox(height: AppSizes.h(20)),

            OnboardingText(
              title: item.title,
              highlightedWord: item.highlightedWord,
              description: item.description,
            ),
          ],
        ),
      ),
    );
  }
}