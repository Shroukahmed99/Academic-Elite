import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentPage;

  const PageIndicator({
    super.key,
    required this.count,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) {
          final bool isActive = index == currentPage;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: EdgeInsets.symmetric(
              horizontal: AppSizes.w(3),
            ),
            width: isActive
                ? AppSizes.w(16)
                : AppSizes.w(6),
            height: AppSizes.h(5),
            decoration: BoxDecoration(
              color: isActive
                  ? ColorsManager.secondary
                  : ColorsManager.font5,
              borderRadius: BorderRadius.circular(
                AppSizes.r(10),
              ),
            ),
          );
        },
      ),
    );
  }
}