import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class AppBarBottomCurve extends StatelessWidget {
  const AppBarBottomCurve({
    super.key,
    this.height = 28,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.h(height),
      child: ClipPath(
        clipper: _AppBarBottomCurveClipper(),
        child: Container(
          color: ColorsManager.primary,
        ),
      ),
    );
  }
}

class _AppBarBottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);

    path.lineTo(size.width, 0);

    path.lineTo(
      size.width,
      size.height * 0.35,
    );

    path.quadraticBezierTo(
      size.width * 0.90,
      size.height,
      size.width * 0.72,
      size.height,
    );

    path.lineTo(
      size.width * 0.28,
      size.height,
    );

    path.quadraticBezierTo(
      size.width * 0.10,
      size.height,
      0,
      size.height * 0.35,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(
    CustomClipper<Path> oldClipper,
  ) {
    return false;
  }
}