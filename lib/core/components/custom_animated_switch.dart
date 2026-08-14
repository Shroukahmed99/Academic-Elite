import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/core/utils/styles_manager.dart';
import 'package:animated_switch/animated_switch.dart';
import 'package:flutter/material.dart';

class CustomAnimatedSwitch extends StatelessWidget {
  const CustomAnimatedSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.textOn,
    this.textOff,
    this.iconOn,
    this.iconOff,
    this.scale = 0.9,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String? textOn;
  final String? textOff;
  final IconData? iconOn;
  final IconData? iconOff;
  final double scale;

  static const animationDuration = Duration.zero;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: AnimatedSwitch(
        value: value,
        onChanged: onChanged,
        animationDuration: animationDuration,
        colorOn: ColorsManager.primary,
        colorOff: ColorsManager.font4,
        indicatorColor: ColorsManager.white,
        textOn: textOn,
        textOff: textOff,
        iconOn: iconOn,
        iconOff: iconOff,
        textStyle: StylesManager.font1Regular12.copyWith(
          color: ColorsManager.white,
        ),
      ),
    );
  }
}
