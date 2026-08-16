import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.leading,
    this.actions,
  });

  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget? leading;
  final List<Widget>? actions;

  static const double _height = 108;
  static const double _contentHorizontalPadding = 16;
  static const double _buttonSize = 40;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.h(_height),
      width: double.infinity,
      child: Stack(
        children: [
          _buildBackground(),

          if (title.isNotEmpty)
            Positioned(
              left: AppSizes.w(70),
              right: AppSizes.w(70),
              top: AppSizes.h(54),
              child: Center(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontSize: AppSizes.sp(18),
                  ),
                ),
              ),
            ),

          if (actions != null && actions!.isNotEmpty)
            PositionedDirectional(
              end: AppSizes.w(_contentHorizontalPadding),
              top: AppSizes.h(48),
              child: Row(mainAxisSize: MainAxisSize.min, children: actions!),
            ),

          if (showBackButton || leading != null)
            PositionedDirectional(
              end: AppSizes.w(_contentHorizontalPadding),
              top: AppSizes.h(48),
              child: SizedBox(
                width: AppSizes.w(_buttonSize),
                height: AppSizes.h(_buttonSize),
                child: leading ?? _BackButton(onPressed: onBackPressed),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.primary,
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsManager.transparent,
      child: InkWell(
        onTap: onPressed ?? () => Navigator.of(context).maybePop(),
        borderRadius: BorderRadius.circular(100),
        child: Container(
          width: AppSizes.w(40),
          height: AppSizes.h(40),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorsManager.white.withValues(alpha: 0.20),
              width: AppSizes.w(1),
            ),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.chevron_right,
            size: AppSizes.sp(27),
            color: ColorsManager.white,
          ),
        ),
      ),
    );
  }
}
