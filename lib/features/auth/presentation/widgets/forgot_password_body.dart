import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/custom_button.dart';
import 'package:academic_elite/core/components/custom_text_field.dart';
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
import 'package:academic_elite/features/auth/presentation/widgets/auth_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({super.key});

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController(
      text: 'shrouk@gmail.com',
    );
  }

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      title: context.l10n.forgotPassword,
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: _handleState,
        child: Form(
          key: _formKey,
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

              _buildButton(context),

              SizedBox(height: AppSizes.h(30)),
            ],
          ),
        ),
      ),
    );
  }

  void _handleState(
    BuildContext context,
    ForgotPasswordState state,
  ) {
    if (state is ForgotPasswordSuccess) {
      context.pushNamed(
        AppRoutes.otpVerification,
        arguments: _emailController.text.trim(),
      );
      return;
    }

    if (state is ForgotPasswordError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
        ),
      );
    }
  }

  Widget _buildEmailField(BuildContext context) {
    return CustomTextField(
      controller: _emailController,
      hintText: context.l10n.emailHint,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      validator: ValidationHelper.validateEmail,
      prefixIcon: Padding(
        padding: EdgeInsets.all(AppSizes.p14),
        child: SvgPicture.asset(
          AssetsManager.mail,
          width: AppSizes.w(20),
          height: AppSizes.h(20),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return CustomButton(
          text: context.l10n.sendVerificationCode,
          isLoading: state is ForgotPasswordLoading,
          onPressed: _sendCode,
          height: 50,
          borderRadius: 24,
          textStyle: context.textTheme.titleMedium!.copyWith(
            color: ColorsManager.white,
          ),
        );
      },
    );
  }

  void _sendCode() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.pushNamed(
      AppRoutes.otpVerification,
      arguments: _emailController.text.trim(),
    );
  }
}