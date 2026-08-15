import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/custom_app_bar.dart';
import 'package:academic_elite/core/components/custom_button.dart';
import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/components/curved_page_layout.dart';
import 'package:academic_elite/core/extensions/localization_extension.dart';
import 'package:academic_elite/core/extensions/navigation_extension.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterSuccessBody extends StatelessWidget {
  const RegisterSuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return CurvedPageLayout(
      header: CustomAppBar(
        title: context.l10n.createAccount,
        showBackButton: false,
      ),
      bodyPadding: EdgeInsets.symmetric(horizontal: AppSizes.p16),
      scrollable: false,
      body: _buildContent(context),
    );
  }


  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSuccessImage(),

        SizedBox(height: AppSizes.h(16)),

        _buildTitle(context),

        SizedBox(height: AppSizes.h(8)),

        _buildDescription(context),

        SizedBox(height: AppSizes.h(20)),

        _buildHomeButton(context),
      ],
    );
  }


  Widget _buildSuccessImage() {
    return SizedBox(
      width: AppSizes.w(90),
      height: AppSizes.h(90),
      child: SvgPicture.asset(AssetsManager.doneImage, fit: BoxFit.contain),
    );
  }


  Widget _buildTitle(BuildContext context) {
    return CustomText(
      text: context.l10n.registerSuccessTitle,
      textAlign: TextAlign.center,
      style: context.textTheme.labelLarge,
    );
  }

  Widget _buildDescription(BuildContext context) {
    return CustomText(
      text: context.l10n.registerSuccessDescription,
      textAlign: TextAlign.center,
      style: context.textTheme.bodySmall,
    );
  }

  Widget _buildHomeButton(BuildContext context) {
    return CustomButton(
      text: context.l10n.goToHome,
      onPressed: () {
        context.pushNamedAndRemoveUntil(AppRoutes.home);
      },
      height: 50,
      borderRadius: 24,
      textStyle: context.textTheme.labelLarge,
      suffixIcon: Icon(
        Icons.home_rounded,
        color: ColorsManager.white,
        size: AppSizes.sp(20),
      ),
    );
  }
}
