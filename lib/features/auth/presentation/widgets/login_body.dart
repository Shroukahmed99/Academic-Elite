import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/curved_page_layout.dart';
import 'package:academic_elite/core/components/custom_app_bar.dart';
import 'package:academic_elite/core/components/custom_button.dart';
import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/components/custom_text_field.dart';
import 'package:academic_elite/core/errors/mappers/failure_to_message_mapper.dart';
import 'package:academic_elite/core/extensions/localization_extension.dart';
import 'package:academic_elite/core/extensions/navigation_extension.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/core/validators/validation_helper.dart';
import 'package:academic_elite/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:academic_elite/features/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:academic_elite/features/auth/presentation/widgets/account_switch_button.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_divider.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedPageLayout(
      bodyPadding: EdgeInsets.symmetric(horizontal: AppSizes.p16),
      header: CustomAppBar(
        title: context.l10n.login,
        showBackButton: true,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: _handleLoginState,
        child: Form(
          key: context.read<LoginCubit>().formKey,
          child: Column(
            children: [
              AuthHeader(
                title: context.l10n.welcomeBack,
                description: context.l10n.loginDescription,
              ),

              SizedBox(height: AppSizes.h(20)),

              const AuthDivider(),

              SizedBox(height: AppSizes.h(20)),

              _buildEmailField(context),

              SizedBox(height: AppSizes.h(12)),

              _buildPasswordField(context),

              SizedBox(height: AppSizes.h(8)),

              _buildRememberRow(context),

              SizedBox(height: AppSizes.h(20)),

              _buildLoginButton(context),

              SizedBox(height: AppSizes.h(12)),

              _buildCreateAccountButton(context),

              SizedBox(height: AppSizes.h(8)),

              _buildGuestButton(context),

              SizedBox(height: AppSizes.h(30)),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLoginState(BuildContext context, LoginState state) {
    if (state is LoginSuccess) {
      context.pushNamedAndRemoveUntil(AppRoutes.home);
      return;
    }

    if (state is LoginError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mapFailureToMessage(context, state.failure))),
      );
    }
  }

  Widget _buildEmailField(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return CustomTextField(
      controller: cubit.emailController,
      hintText: context.l10n.emailHint,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: ValidationHelper.validateEmail,
      prefixIcon: Padding(
        padding: EdgeInsets.all(AppSizes.p14),
        child: SvgPicture.asset(AssetsManager.mail),
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return CustomTextField(
      controller: cubit.passwordController,
      hintText: context.l10n.passwordHint,
      isPassword: true,
      textInputAction: TextInputAction.done,
      validator: ValidationHelper.validatePassword,
      prefixIcon: Padding(
        padding: EdgeInsets.all(AppSizes.p14),
        child: SvgPicture.asset(AssetsManager.lockPassword),
      ),
    );
  }

  Widget _buildRememberRow(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();

        return Row(
          children: [
            Checkbox(
              value: cubit.rememberMe,
              onChanged: (value) {
                cubit.toggleRememberMe(value ?? false);
              },
              activeColor: ColorsManager.primary,
              side: BorderSide(
                color: ColorsManager.primary40,
                width: AppSizes.w(1),
              ),
              visualDensity: VisualDensity.compact,
            ),

            CustomText(
              text: context.l10n.rememberMe,
              style: context.textTheme.bodySmall!,
            ),

            const Spacer(),

            InkWell(
              onTap: () {
                context.pushNamed(AppRoutes.forgotPassword);
              },
              child: CustomText(
                text: context.l10n.forgotPassword,
                style: context.textTheme.labelLarge!.copyWith(
                  color: ColorsManager.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomButton(
          text: context.l10n.login,
          isLoading: state is LoginLoading,
          onPressed: () {
            context.read<LoginCubit>().login();
          },
          height: 50,
          borderRadius: 24,
          textStyle: context.textTheme.titleMedium!.copyWith(
            color: ColorsManager.white,
          ),
        );
      },
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return AccountSwitchButton(
      leadingText: context.l10n.noAccount,
      actionText: context.l10n.createAccount,
      onPressed: () {
        context.pushNamed(AppRoutes.register);
      },
    );
  }

  Widget _buildGuestButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamedAndRemoveUntil(AppRoutes.home);
      },
      child: CustomText(
        text: context.l10n.continueAsGuest,
        style: context.textTheme.labelMedium!.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
