import 'package:academic_elite/features/onboarding/data/model/onboarding_model.dart';
import 'package:academic_elite/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';

class OnboardingList extends StatelessWidget {
  final PageController controller;
  final List<OnboardingModel> items;
  final ValueChanged<int> onPageChanged;

  const OnboardingList({
    super.key,
    required this.controller,
    required this.items,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: items.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return OnboardingPage(
          item: items[index],
        );
      },
    );
  }
}