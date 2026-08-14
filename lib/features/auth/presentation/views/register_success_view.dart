import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/custom_button.dart';
import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/extensions/navigation_extension.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class RegisterSuccessView extends StatelessWidget {
  const RegisterSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return Scaffold(
      backgroundColor: ColorsManager.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.p16,
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.p20,
                vertical: AppSizes.p24,
              ),
              decoration: BoxDecoration(
                color: ColorsManager.background,
                borderRadius: BorderRadius.circular(
                  AppSizes.r20,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSuccessIcon(),

                  SizedBox(
                    height: AppSizes.h(20),
                  ),

                  CustomText(
                    text: 'تم إنشاء حساب جديد بنجاح',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headlineSmall!,
                  ),

                  SizedBox(
                    height: AppSizes.h(8),
                  ),

                  CustomText(
                    text: 'حسابك جاهز - لنبدأ الدراسة.',
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium!,
                  ),

                  SizedBox(
                    height: AppSizes.h(24),
                  ),

                  CustomButton(
                    text: 'الذهاب للرئيسية',
                    onPressed: () {
                      context.pushNamedAndRemoveUntil(
                        AppRoutes.home,
                      );
                    },
                    height: 50,
                    borderRadius: 24,
                    textStyle:
                        context.textTheme.titleMedium!.copyWith(
                      color: ColorsManager.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Container(
      width: AppSizes.w(80),
      height: AppSizes.w(80),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.10),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: AppSizes.w(58),
          height: AppSizes.w(58),
          decoration: const BoxDecoration(
            color: Color(0xFF31C45B),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            color: ColorsManager.white,
            size: AppSizes.sp(34),
          ),
        ),
      ),
    );
  }
}