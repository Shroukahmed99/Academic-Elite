import 'package:academic_elite/core/components/custom_app_bar.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class AuthPageLayout extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onBackPressed;

  const AuthPageLayout({
    super.key,
    required this.title,
    required this.child,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return ColoredBox(
      color: ColorsManager.primary,
      child: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SizedBox(
      height: AppSizes.h(108),
      child: CustomAppBar(
        title: title,
        showBackButton: true,
        onBackPressed: onBackPressed,
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.r28),
          topRight: Radius.circular(AppSizes.r28),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.r28),
          topRight: Radius.circular(AppSizes.r28),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.p16,
          ),
          child: child,
        ),
      ),
    );
  }
}