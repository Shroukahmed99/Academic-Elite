import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/custom_app_bar.dart';
import 'package:academic_elite/core/components/custom_button.dart';
import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/components/custom_text_field.dart';
import 'package:academic_elite/core/components/curved_page_layout.dart';
import 'package:academic_elite/core/errors/mappers/failure_to_message_mapper.dart';
import 'package:academic_elite/core/extensions/localization_extension.dart';
import 'package:academic_elite/core/extensions/navigation_extension.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/core/validators/validation_helper.dart';
import 'package:academic_elite/features/auth/presentation/manager/create_password_cubit/create_password_cubit.dart';
import 'package:academic_elite/features/auth/presentation/manager/create_password_cubit/create_password_state.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatePasswordBody extends StatelessWidget {
  const CreatePasswordBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return CurvedPageLayout(
      bodyPadding: EdgeInsets.symmetric(horizontal: AppSizes.p16),
      header: CustomAppBar(
        title: context.l10n.newPassword,
        showBackButton: true,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: BlocListener<CreatePasswordCubit, CreatePasswordState>(
        listener: _handleState,
        child: Form(
          key: context.read<CreatePasswordCubit>().formKey,
          child: Column(
            children: [
              SizedBox(height: AppSizes.h(24)),
              SizedBox(
                width: AppSizes.w(90),
                height: AppSizes.h(90),
                child: SvgPicture.asset(
                  AssetsManager.lockPasswordImage,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: AppSizes.h(16)),

              CustomText(
                text: context.l10n.chooseStrongPassword,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorsManager.font1,
                ),
              ),

              SizedBox(height: AppSizes.h(24)),

              SizedBox(height: AppSizes.h(20)),

              const AuthDivider(),

              SizedBox(height: AppSizes.h(20)),

              _buildPasswordField(context),

              SizedBox(height: AppSizes.h(12)),

              _buildConfirmPasswordField(context),

              SizedBox(height: AppSizes.h(20)),

              _buildSaveButton(context),

              SizedBox(height: AppSizes.h(30)),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // STATE
  // ============================================================

  void _handleState(BuildContext context, CreatePasswordState state) {
    if (state is CreatePasswordSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.passwordChangedSuccessfully)),
      );

      context.pushNamedAndRemoveUntil(AppRoutes.login);

      return;
    }

    if (state is CreatePasswordError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mapFailureToMessage(context, state.failure))),
      );
    }
  }

  // ============================================================
  // PASSWORD
  // ============================================================

  Widget _buildPasswordField(BuildContext context) {
    final cubit = context.read<CreatePasswordCubit>();

    return CustomTextField(
      controller: cubit.passwordController,
      hintText: context.l10n.newPasswordHint,
      isPassword: true,
      textInputAction: TextInputAction.next,
      validator: ValidationHelper.validatePassword,
      prefixIcon: Padding(
        padding: EdgeInsets.all(AppSizes.p14),
        child: SvgPicture.asset(
          AssetsManager.lockPassword,
          width: AppSizes.sp(20),
          height: AppSizes.sp(20),
        ),
      ),
    );
  }

  // ============================================================
  // CONFIRM PASSWORD
  // ============================================================

  Widget _buildConfirmPasswordField(BuildContext context) {
    final cubit = context.read<CreatePasswordCubit>();

    return CustomTextField(
      controller: cubit.confirmPasswordController,
      hintText: context.l10n.confirmNewPasswordHint,
      isPassword: true,
      textInputAction: TextInputAction.done,
      validator: (value) {
        final passwordError = ValidationHelper.validatePassword(value);

        if (passwordError != null) {
          return passwordError;
        }

        return ValidationHelper.validateConfirmPassword(
          value,
          cubit.passwordController.text,
        );
      },
      prefixIcon: Padding(
        padding: EdgeInsets.all(AppSizes.p14),
        child: SvgPicture.asset(
          AssetsManager.lockPassword,
          width: AppSizes.sp(20),
          height: AppSizes.sp(20),
        ),
      ),
    );
  }

  // ============================================================
  // SAVE BUTTON
  // ============================================================

  Widget _buildSaveButton(BuildContext context) {
    return BlocBuilder<CreatePasswordCubit, CreatePasswordState>(
      builder: (context, state) {
        return CustomButton(
          text: context.l10n.saveAndLogin,
          height: 50,
          borderRadius: 24,
          isLoading: state is CreatePasswordLoading,
          onPressed: () {
            context.read<CreatePasswordCubit>().createPassword(email: email);
          },
          textStyle: context.textTheme.titleMedium!.copyWith(
            color: ColorsManager.white,
          ),
        );
      },
    );
  }
}
