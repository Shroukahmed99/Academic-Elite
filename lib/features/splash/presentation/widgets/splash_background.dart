import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsManager.intro,
      fit: BoxFit.cover,
    );
  }
}