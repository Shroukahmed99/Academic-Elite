import 'package:flutter/material.dart';
import 'colors_manager.dart';

class StylesManager {
  StylesManager._();

  static const String fontFamily = 'Almarai';

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;

  static TextStyle _style({
    required double size,
    required FontWeight weight,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: 1.5,
    );
  }

  static TextStyle font1Regular60 = _style(
    size: 60,
    weight: regular,
    color: ColorsManager.font1,
  );

  static TextStyle font1Medium60 = _style(
    size: 60,
    weight: medium,
    color: ColorsManager.font1,
  );

  static TextStyle font1Bold60 = _style(
    size: 60,
    weight: bold,
    color: ColorsManager.font1,
  );

  static TextStyle font1Regular36 = _style(
    size: 36,
    weight: regular,
    color: ColorsManager.font1,
  );

  static TextStyle font1Medium36 = _style(
    size: 36,
    weight: medium,
    color: ColorsManager.font1,
  );

  static TextStyle font1Bold36 = _style(
    size: 36,
    weight: bold,
    color: ColorsManager.font1,
  );

  static TextStyle font1Regular32 = _style(
    size: 32,
    weight: regular,
    color: ColorsManager.font1,
  );

  static TextStyle font1Medium32 = _style(
    size: 32,
    weight: medium,
    color: ColorsManager.font1,
  );

  static TextStyle font1Bold32 = _style(
    size: 32,
    weight: bold,
    color: ColorsManager.font1,
  );

  static TextStyle font1Regular28 = _style(
    size: 28,
    weight: regular,
    color: ColorsManager.font1,
  );

  static TextStyle font1Medium28 = _style(
    size: 28,
    weight: medium,
    color: ColorsManager.font1,
  );

  static TextStyle font1Bold28 = _style(
    size: 28,
    weight: bold,
    color: ColorsManager.font1,
  );

  static TextStyle font1Regular24 = _style(
    size: 24,
    weight: regular,
    color: ColorsManager.font1,
  );

  static TextStyle font1Medium24 = _style(
    size: 24,
    weight: medium,
    color: ColorsManager.font1,
  );

  static TextStyle font1Bold24 = _style(
    size: 24,
    weight: bold,
    color: ColorsManager.font1,
  );

  static TextStyle font1Regular20 = _style(
    size: 20,
    weight: regular,
    color: ColorsManager.font1,
  );

  static TextStyle font1Medium20 = _style(
    size: 20,
    weight: medium,
    color: ColorsManager.font1,
  );

  static TextStyle font1Bold20 = _style(
    size: 20,
    weight: bold,
    color: ColorsManager.font1,
  );

  static TextStyle font1Regular16 = _style(
    size: 16,
    weight: regular,
    color: ColorsManager.font1,
  );

  static TextStyle font1Medium16 = _style(
    size: 16,
    weight: medium,
    color: ColorsManager.font1,
  );

  static TextStyle font1Bold16 = _style(
    size: 16,
    weight: bold,
    color: ColorsManager.font1,
  );

  static TextStyle font1Regular14 = _style(
    size: 14,
    weight: regular,
    color: ColorsManager.font1,
  );

  static TextStyle font1Medium14 = _style(
    size: 14,
    weight: medium,
    color: ColorsManager.font1,
  );

  static TextStyle font1Bold14 = _style(
    size: 14,
    weight: bold,
    color: ColorsManager.font1,
  );

  static TextStyle font1Regular12 = _style(
    size: 12,
    weight: regular,
    color: ColorsManager.font1,
  );

  static TextStyle font1Medium12 = _style(
    size: 12,
    weight: medium,
    color: ColorsManager.font1,
  );

  static TextStyle font1Bold12 = _style(
    size: 12,
    weight: bold,
    color: ColorsManager.font1,
  );

  static TextStyle font1Regular10 = _style(
    size: 10,
    weight: regular,
    color: ColorsManager.font1,
  );

  static TextStyle font1Medium10 = _style(
    size: 10,
    weight: medium,
    color: ColorsManager.font1,
  );

  static TextStyle font1Bold10 = _style(
    size: 10,
    weight: bold,
    color: ColorsManager.font1,
  );

  static TextStyle font1Regular8 = _style(
    size: 8,
    weight: regular,
    color: ColorsManager.font1,
  );

  static TextStyle font1Medium8 = _style(
    size: 8,
    weight: medium,
    color: ColorsManager.font1,
  );

  static TextStyle font1Bold8 = _style(
    size: 8,
    weight: bold,
    color: ColorsManager.font1,
  );

  static TextStyle font2Regular16 = _style(
    size: 16,
    weight: regular,
    color: ColorsManager.font2,
  );

  static TextStyle font2Medium16 = _style(
    size: 16,
    weight: medium,
    color: ColorsManager.font2,
  );

  static TextStyle font2Bold16 = _style(
    size: 16,
    weight: bold,
    color: ColorsManager.font2,
  );

  static TextStyle font2Regular14 = _style(
    size: 14,
    weight: regular,
    color: ColorsManager.font2,
  );

  static TextStyle font2Medium14 = _style(
    size: 14,
    weight: medium,
    color: ColorsManager.font2,
  );

  static TextStyle font2Bold14 = _style(
    size: 14,
    weight: bold,
    color: ColorsManager.font2,
  );

  static TextStyle font2Regular12 = _style(
    size: 12,
    weight: regular,
    color: ColorsManager.font2,
  );

  static TextStyle font2Medium12 = _style(
    size: 12,
    weight: medium,
    color: ColorsManager.font2,
  );

  static TextStyle font2Bold12 = _style(
    size: 12,
    weight: bold,
    color: ColorsManager.font2,
  );

  static TextStyle font2Regular10 = _style(
    size: 10,
    weight: regular,
    color: ColorsManager.font2,
  );

  static TextStyle font2Medium10 = _style(
    size: 10,
    weight: medium,
    color: ColorsManager.font2,
  );

  static TextStyle font2Bold10 = _style(
    size: 10,
    weight: bold,
    color: ColorsManager.font2,
  );

  static TextStyle font2Regular8 = _style(
    size: 8,
    weight: regular,
    color: ColorsManager.font2,
  );

  static TextStyle font2Medium8 = _style(
    size: 8,
    weight: medium,
    color: ColorsManager.font2,
  );

  static TextStyle font2Bold8 = _style(
    size: 8,
    weight: bold,
    color: ColorsManager.font2,
  );

  static TextStyle font3Regular16 = _style(
    size: 16,
    weight: regular,
    color: ColorsManager.font3,
  );

  static TextStyle font3Medium16 = _style(
    size: 16,
    weight: medium,
    color: ColorsManager.font3,
  );

  static TextStyle font3Bold16 = _style(
    size: 16,
    weight: bold,
    color: ColorsManager.font3,
  );

  static TextStyle font3Regular14 = _style(
    size: 14,
    weight: regular,
    color: ColorsManager.font3,
  );

  static TextStyle font3Medium14 = _style(
    size: 14,
    weight: medium,
    color: ColorsManager.font3,
  );

  static TextStyle font3Bold14 = _style(
    size: 14,
    weight: bold,
    color: ColorsManager.font3,
  );

  static TextStyle font3Regular12 = _style(
    size: 12,
    weight: regular,
    color: ColorsManager.font3,
  );

  static TextStyle font3Medium12 = _style(
    size: 12,
    weight: medium,
    color: ColorsManager.font3,
  );

  static TextStyle font3Bold12 = _style(
    size: 12,
    weight: bold,
    color: ColorsManager.font3,
  );

  static TextStyle font3Regular10 = _style(
    size: 10,
    weight: regular,
    color: ColorsManager.font3,
  );

  static TextStyle font3Medium10 = _style(
    size: 10,
    weight: medium,
    color: ColorsManager.font3,
  );

  static TextStyle font3Bold10 = _style(
    size: 10,
    weight: bold,
    color: ColorsManager.font3,
  );

  static TextStyle font3Regular8 = _style(
    size: 8,
    weight: regular,
    color: ColorsManager.font3,
  );

  static TextStyle font3Medium8 = _style(
    size: 8,
    weight: medium,
    color: ColorsManager.font3,
  );

  static TextStyle font3Bold8 = _style(
    size: 8,
    weight: bold,
    color: ColorsManager.font3,
  );

  static TextStyle primaryRegular20 = _style(
    size: 20,
    weight: regular,
    color: ColorsManager.primary,
  );

  static TextStyle primaryMedium20 = _style(
    size: 20,
    weight: medium,
    color: ColorsManager.primary,
  );

  static TextStyle primaryBold20 = _style(
    size: 20,
    weight: bold,
    color: ColorsManager.primary,
  );

  static TextStyle primaryRegular16 = _style(
    size: 16,
    weight: regular,
    color: ColorsManager.primary,
  );

  static TextStyle primaryMedium16 = _style(
    size: 16,
    weight: medium,
    color: ColorsManager.primary,
  );

  static TextStyle primaryBold16 = _style(
    size: 16,
    weight: bold,
    color: ColorsManager.primary,
  );

  static TextStyle primaryRegular14 = _style(
    size: 14,
    weight: regular,
    color: ColorsManager.primary,
  );

  static TextStyle primaryMedium14 = _style(
    size: 14,
    weight: medium,
    color: ColorsManager.primary,
  );

  static TextStyle primaryBold14 = _style(
    size: 14,
    weight: bold,
    color: ColorsManager.primary,
  );

  static TextStyle primaryRegular12 = _style(
    size: 12,
    weight: regular,
    color: ColorsManager.primary,
  );

  static TextStyle primaryMedium12 = _style(
    size: 12,
    weight: medium,
    color: ColorsManager.primary,
  );

  static TextStyle primaryBold12 = _style(
    size: 12,
    weight: bold,
    color: ColorsManager.primary,
  );

  static TextStyle primaryRegular10 = _style(
    size: 10,
    weight: regular,
    color: ColorsManager.primary,
  );

  static TextStyle primaryMedium10 = _style(
    size: 10,
    weight: medium,
    color: ColorsManager.primary,
  );

  static TextStyle primaryBold10 = _style(
    size: 10,
    weight: bold,
    color: ColorsManager.primary,
  );

  static TextStyle secondaryRegular20 = _style(
    size: 20,
    weight: regular,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryMedium20 = _style(
    size: 20,
    weight: medium,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryBold20 = _style(
    size: 20,
    weight: bold,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryRegular16 = _style(
    size: 16,
    weight: regular,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryMedium16 = _style(
    size: 16,
    weight: medium,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryBold16 = _style(
    size: 16,
    weight: bold,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryRegular14 = _style(
    size: 14,
    weight: regular,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryMedium14 = _style(
    size: 14,
    weight: medium,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryBold14 = _style(
    size: 14,
    weight: bold,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryRegular12 = _style(
    size: 12,
    weight: regular,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryMedium12 = _style(
    size: 12,
    weight: medium,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryBold12 = _style(
    size: 12,
    weight: bold,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryRegular10 = _style(
    size: 10,
    weight: regular,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryMedium10 = _style(
    size: 10,
    weight: medium,
    color: ColorsManager.secondary,
  );

  static TextStyle secondaryBold10 = _style(
    size: 10,
    weight: bold,
    color: ColorsManager.secondary,
  );

  static TextStyle whiteRegular20 = _style(
    size: 20,
    weight: regular,
    color: ColorsManager.white,
  );

  static TextStyle whiteMedium20 = _style(
    size: 20,
    weight: medium,
    color: ColorsManager.white,
  );

  static TextStyle whiteBold20 = _style(
    size: 20,
    weight: bold,
    color: ColorsManager.white,
  );

  static TextStyle whiteRegular16 = _style(
    size: 16,
    weight: regular,
    color: ColorsManager.white,
  );

  static TextStyle whiteMedium16 = _style(
    size: 16,
    weight: medium,
    color: ColorsManager.white,
  );

  static TextStyle whiteBold16 = _style(
    size: 16,
    weight: bold,
    color: ColorsManager.white,
  );

  static TextStyle whiteRegular14 = _style(
    size: 14,
    weight: regular,
    color: ColorsManager.white,
  );

  static TextStyle whiteMedium14 = _style(
    size: 14,
    weight: medium,
    color: ColorsManager.white,
  );

  static TextStyle whiteBold14 = _style(
    size: 14,
    weight: bold,
    color: ColorsManager.white,
  );

  static TextStyle whiteRegular12 = _style(
    size: 12,
    weight: regular,
    color: ColorsManager.white,
  );

  static TextStyle whiteMedium12 = _style(
    size: 12,
    weight: medium,
    color: ColorsManager.white,
  );

  static TextStyle whiteBold12 = _style(
    size: 12,
    weight: bold,
    color: ColorsManager.white,
  );

  static TextStyle whiteRegular10 = _style(
    size: 10,
    weight: regular,
    color: ColorsManager.white,
  );

  static TextStyle whiteMedium10 = _style(
    size: 10,
    weight: medium,
    color: ColorsManager.white,
  );

  static TextStyle whiteBold10 = _style(
    size: 10,
    weight: bold,
    color: ColorsManager.white,
  );

  static TextStyle redRegular14 = _style(
    size: 14,
    weight: regular,
    color: ColorsManager.red,
  );

  static TextStyle redMedium14 = _style(
    size: 14,
    weight: medium,
    color: ColorsManager.red,
  );

  static TextStyle redBold14 = _style(
    size: 14,
    weight: bold,
    color: ColorsManager.red,
  );

  static TextStyle redRegular12 = _style(
    size: 12,
    weight: regular,
    color: ColorsManager.red,
  );

  static TextStyle redMedium12 = _style(
    size: 12,
    weight: medium,
    color: ColorsManager.red,
  );

  static TextStyle redBold12 = _style(
    size: 12,
    weight: bold,
    color: ColorsManager.red,
  );

  static TextStyle redRegular10 = _style(
    size: 10,
    weight: regular,
    color: ColorsManager.red,
  );

  static TextStyle redMedium10 = _style(
    size: 10,
    weight: medium,
    color: ColorsManager.red,
  );

  static TextStyle redBold10 = _style(
    size: 10,
    weight: bold,
    color: ColorsManager.red,
  );

  static TextStyle greenRegular14 = _style(
    size: 14,
    weight: regular,
    color: ColorsManager.green,
  );

  static TextStyle greenMedium14 = _style(
    size: 14,
    weight: medium,
    color: ColorsManager.green,
  );

  static TextStyle greenBold14 = _style(
    size: 14,
    weight: bold,
    color: ColorsManager.green,
  );

  static TextStyle greenRegular12 = _style(
    size: 12,
    weight: regular,
    color: ColorsManager.green,
  );

  static TextStyle greenMedium12 = _style(
    size: 12,
    weight: medium,
    color: ColorsManager.green,
  );

  static TextStyle greenBold12 = _style(
    size: 12,
    weight: bold,
    color: ColorsManager.green,
  );

  static TextStyle greenRegular10 = _style(
    size: 10,
    weight: regular,
    color: ColorsManager.green,
  );

  static TextStyle greenMedium10 = _style(
    size: 10,
    weight: medium,
    color: ColorsManager.green,
  );

  static TextStyle greenBold10 = _style(
    size: 10,
    weight: bold,
    color: ColorsManager.green,
  );
}
