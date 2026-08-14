import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class IconCircleWidget extends StatelessWidget {
  const IconCircleWidget({
    super.key,
    required this.icon,
    this.onTap,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    this.isCircle = true,
  });

  final Widget icon;
  final VoidCallback? onTap;

  final double? size;
  final double? iconSize;

  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;

  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    final widgetSize = size ?? AppSizes.w40;
    final borderRadius = BorderRadius.circular(AppSizes.r16);

    return Material(
      color: ColorsManager.transparent,
      shape: isCircle
          ? const CircleBorder()
          : RoundedRectangleBorder(borderRadius: borderRadius),
      child: InkWell(
        onTap: onTap,
        customBorder: isCircle ? const CircleBorder() : null,
        borderRadius: isCircle ? null : borderRadius,
        child: Container(
          width: widgetSize,
          height: widgetSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor ?? ColorsManager.primary10,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircle ? null : borderRadius,
            border: Border.all(
              color: borderColor ?? ColorsManager.font5,
              width: 1,
            ),
          ),
          child: IconTheme(
            data: IconThemeData(
              color: iconColor ?? ColorsManager.primary,
              size: iconSize ?? AppSizes.sp18,
            ),
            child: icon,
          ),
        ),
      ),
    );
  }
}
