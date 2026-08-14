import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class SplashAppName extends StatelessWidget {
  const SplashAppName({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return Positioned(
      left: AppSizes.p32,
      right: AppSizes.p32,
      bottom: AppSizes.h(140),
      child: Image.asset(
        AssetsManager.nameApp,
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}