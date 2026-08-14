import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/features/language/presentation/widgets/selection_circle.dart';
import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({
    super.key,
    required this.title,
    required this.flag,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String flag;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.r(16)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        height: AppSizes.h(70),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.p12),
        decoration: BoxDecoration(
          color: selected ? ColorsManager.secondary10 : ColorsManager.font6,
          borderRadius: BorderRadius.circular(AppSizes.r(16)),
          border: Border.all(
            color: selected ? ColorsManager.primary: ColorsManager.font6,
            width: selected ? 1 : 0,
          ),
        ),
        child: Row(
          children: [
            _buildFlag(),

            SizedBox(width: AppSizes.w(8)),

            Expanded(
              child: CustomText(
                text: title,
                textAlign: TextAlign.right,
                style: context.textTheme.titleSmall,
              ),
            ),

            SizedBox(width: AppSizes.w(12)),

            SelectionCircle(selected: selected),
          ],
        ),
      ),
    );
  }

  Widget _buildFlag() {
    return Text(flag, style: TextStyle(fontSize: AppSizes.sp(18)));
  }
}
