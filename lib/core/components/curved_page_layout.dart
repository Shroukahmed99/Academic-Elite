import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class CurvedPageLayout extends StatelessWidget {
  const CurvedPageLayout({
    super.key,
    required this.header,
    required this.body,
    this.headerHeight = 108,
    this.borderRadius = 28,
    this.bodyPadding,
    this.bodyPhysics = const BouncingScrollPhysics(),
    this.scrollable = true,
  });

  /// الجزء الكحلي العلوي
  final Widget header;

  /// محتوى الصفحة الأبيض
  final Widget body;

  /// ارتفاع الجزء العلوي
  final double headerHeight;

  /// مقدار الـ curve
  final double borderRadius;

  /// Padding محتوى الصفحة
  final EdgeInsetsGeometry? bodyPadding;

  /// Physics للـ Scroll
  final ScrollPhysics bodyPhysics;

  /// هل محتوى الصفحة Scrollable؟
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return ColoredBox(
      color: ColorsManager.primary,
      child: Column(
        children: [
          SizedBox(height: AppSizes.h(headerHeight), child: header),

          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    final double radius = AppSizes.r(borderRadius);

    final Widget content = Padding(
      padding: bodyPadding ?? EdgeInsets.zero,
      child: body,
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
        child: scrollable
            ? SingleChildScrollView(physics: bodyPhysics, child: content)
            : content,
      ),
    );
  }
}
