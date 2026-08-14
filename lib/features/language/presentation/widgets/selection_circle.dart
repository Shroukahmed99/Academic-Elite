import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class SelectionCircle extends StatelessWidget {
  const SelectionCircle({
    super.key,
    required this.selected,
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: AppSizes.w24,
      height: AppSizes.w24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected
              ? ColorsManager.font1
              : ColorsManager.font4,
          width: selected ? 1.5 : 1,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: AppSizes.w(10),
                height: AppSizes.h(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.font1,
                ),
              ),
            )
          : null,
    );
  }
}