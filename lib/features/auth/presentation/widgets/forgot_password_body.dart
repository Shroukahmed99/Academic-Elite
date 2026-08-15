import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/custom_app_bar.dart';
import 'package:academic_elite/core/components/custom_button.dart';
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
import 'package:academic_elite/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:academic_elite/features/auth/presentation/manager/forgot_password_cubit/forgot_password_state.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_divider.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();

    return CurvedPageLayout(
      bodyPadding: EdgeInsets.symmetric(horizontal: AppSizes.p16),
      header: CustomAppBar(
        title: context.l10n.forgotPassword,
        showBackButton: true,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),

      body: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: _handleState,

        child: Form(
          key: cubit.formKey,

          child: Column(
            children: [
              AuthHeader(
                title: context.l10n.resetPassword,
                description: context.l10n.resetPasswordDescription,
              ),

              SizedBox(height: AppSizes.h(20)),

              const AuthDivider(),

              SizedBox(height: AppSizes.h(20)),

              _buildEmailField(context),

              SizedBox(height: AppSizes.h(20)),

              _buildSendButton(context),

              SizedBox(height: AppSizes.h(30)),
            ],
          ),
        ),
      ),
    );
  }

  void _handleState(BuildContext context, ForgotPasswordState state) {
    if (state is ForgotPasswordSuccess) {
      final email = context
          .read<ForgotPasswordCubit>()
          .emailController
          .text
          .trim();

      context.pushNamed(AppRoutes.otpVerification, arguments: email);

      return;
    }

    if (state is ForgotPasswordError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mapFailureToMessage(context, state.failure))),
      );
    }
  }

  Widget _buildEmailField(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();

    return CustomTextField(
      controller: cubit.emailController,
      hintText: context.l10n.emailHint,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      validator: ValidationHelper.validateEmail,
      prefixIcon: Padding(
        padding: EdgeInsets.all(AppSizes.p14),
        child: SvgPicture.asset(
          AssetsManager.mail,
          width: AppSizes.sp(20),
          height: AppSizes.sp(20),
        ),
      ),
    );
  }

  // ============================================================

  Widget _buildSendButton(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return CustomButton(
          text: context.l10n.sendVerificationCode,
          isLoading: state is ForgotPasswordLoading,
          height: 50,
          borderRadius: 24,
          onPressed: () {
            context.read<ForgotPasswordCubit>().forgotPassword();
          },
          textStyle: context.textTheme.labelLarge!,
        );
      },
    );
  }
}
