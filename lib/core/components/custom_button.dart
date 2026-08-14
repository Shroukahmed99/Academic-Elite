import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 55,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.borderRadius = 24,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.imagePath,
    this.imageSize = 20,
    this.isLoading = false,
    this.isDisabled = false,
    this.borderColor,
    this.textStyle,
    this.padding,
  });

  factory CustomButton.outlined({
    Key? key,
    required String text,
    required VoidCallback? onPressed,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Color borderColor = ColorsManager.primary,
    Color textColor = ColorsManager.primary,
    double? width,
    double height = 55,
    double borderRadius = 24,
    TextStyle? textStyle,
  }) {
    return CustomButton(
      key: key,
      text: text,
      onPressed: onPressed,
      width: width,
      height: height,
      backgroundColor: Colors.white,
      borderColor: borderColor,
      textColor: textColor,
      borderRadius: borderRadius,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      textStyle: textStyle,
    );
  }

  final String text;
  final VoidCallback? onPressed;

  final double? width;
  final double height;

  final Color? backgroundColor;
  final Color textColor;

  final double borderRadius;

  final IconData? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final String? imagePath;
  final double imageSize;

  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  final bool isLoading;
  final bool isDisabled;

  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final Color background = backgroundColor ?? ColorsManager.primary;

    final TextStyle buttonStyle =
        textStyle ?? context.textTheme.labelLarge!.copyWith(color: textColor);

    return SizedBox(
      width: width ?? double.infinity,
      height: AppSizes.h(height),
      child: ElevatedButton(
        onPressed: isDisabled || isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: background,
          foregroundColor: textColor,
          disabledBackgroundColor: background,
          disabledForegroundColor: textColor,
          padding: padding ?? EdgeInsets.symmetric(horizontal: AppSizes.p16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.r(borderRadius)),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: AppSizes.r(1),
            ),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: AppSizes.w(20),
                height: AppSizes.h(20),
                child: CircularProgressIndicator(
                  strokeWidth: AppSizes.r(2),
                  color: textColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (prefixIcon != null) ...[
                    SizedBox(
                      width: AppSizes.w(20),
                      height: AppSizes.h(20),
                      child: Center(child: prefixIcon),
                    ),
                    SizedBox(width: AppSizes.w(8)),
                  ],
                  if (imagePath != null) ...[
                    Image.asset(
                      imagePath!,
                      width: AppSizes.w(imageSize),
                      height: AppSizes.h(imageSize),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: AppSizes.w(8)),
                  ],
                  if (icon != null) ...[
                    Icon(icon, size: AppSizes.sp20, color: textColor),
                    SizedBox(width: AppSizes.w(8)),
                  ],
                  Flexible(
                    child: CustomText(
                      text: text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: buttonStyle,
                    ),
                  ),
                  if (suffixIcon != null) ...[
                    SizedBox(width: AppSizes.w(8)),
                    SizedBox(
                      width: AppSizes.w20,
                      height: AppSizes.h(20),
                      child: Center(child: suffixIcon),
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}
