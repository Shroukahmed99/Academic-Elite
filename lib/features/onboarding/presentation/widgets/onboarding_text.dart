import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class OnboardingText extends StatelessWidget {
  final String title;
  final String highlightedWord;
  final String description;

  const OnboardingText({
    super.key,
    required this.title,
    required this.highlightedWord,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(context),

        SizedBox(height: AppSizes.h(8)),

        CustomText(
          text: description,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium!,
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    final TextStyle titleStyle = context.textTheme.titleLarge!;

    final int start = title.indexOf(highlightedWord);

    if (start == -1) {
      return CustomText(
        text: title,
        textAlign: TextAlign.center,
        style: titleStyle,
      );
    }

    final int end = start + highlightedWord.length;

    return RichText(
      textAlign: TextAlign.center,
      textDirection: Directionality.of(context),
      text: TextSpan(
        style: titleStyle,
        children: [
          TextSpan(
            text: title.substring(0, start),
          ),
          TextSpan(
            text: title.substring(start, end),
            style: titleStyle.copyWith(
              color: ColorsManager.secondary,
            ),
          ),
          TextSpan(
            text: title.substring(end),
          ),
        ],
      ),
    );
  }
}