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
import 'package:academic_elite/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:academic_elite/features/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:academic_elite/features/auth/presentation/widgets/account_switch_button.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_divider.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_header.dart';
import 'package:academic_elite/features/auth/presentation/widgets/phone_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  bool _acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return CurvedPageLayout(
      header: _buildAppBar(context),
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: _handleState,
        child: _buildContent(context),
      ),
      scrollable: true,
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return CustomAppBar(title: "", showBackButton: false);
  }

  Widget _buildContent(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p16),
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            SizedBox(height: AppSizes.h(28)),

            AuthHeader(
              title: context.l10n.createAccount,
              description: context.l10n.registerDescription,
            ),

            SizedBox(height: AppSizes.h(16)),

            const AuthDivider(),

            SizedBox(height: AppSizes.h(16)),

            _buildNameField(context),

            SizedBox(height: AppSizes.h(10)),

            _buildEmailField(context),

            SizedBox(height: AppSizes.h(10)),

            _buildPhoneField(context),

            SizedBox(height: AppSizes.h(10)),

            _buildPasswordField(context),

            SizedBox(height: AppSizes.h(10)),

            _buildConfirmPasswordField(context),

            SizedBox(height: AppSizes.h(10)),

            _buildTermsRow(context),

            SizedBox(height: AppSizes.h(16)),

            _buildRegisterButton(context),

            SizedBox(height: AppSizes.h(10)),

            _buildLoginButton(context),

            SizedBox(height: AppSizes.h(24)),
          ],
        ),
      ),
    );
  }

  void _handleState(BuildContext context, RegisterState state) {
    if (state is RegisterSuccess) {
      context.pushNamedAndRemoveUntil(AppRoutes.registerSuccess);

      return;
    }

    if (state is RegisterError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mapFailureToMessage(context, state.failure))),
      );
    }
  }

  Widget _buildNameField(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return CustomTextField(
      controller: cubit.nameController,
      hintText: context.l10n.fullNameHint,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return context.l10n.fullNameRequired;
        }

        return null;
      },
      prefixIcon: Padding(
        padding: EdgeInsets.all(AppSizes.p14),
        child: SvgPicture.asset(
          AssetsManager.personalIcon,
          width: AppSizes.sp(20),
          height: AppSizes.sp(20),
        ),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return CustomTextField(
      controller: cubit.emailController,
      hintText: context.l10n.emailHint,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
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

  Widget _buildPhoneField(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return PhoneInputField(
      controller: cubit.phoneController,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return context.l10n.phoneRequired;
        }

        return null;
      },
      onCountryChanged: (country) {
        debugPrint(country.code);
      },
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return CustomTextField(
      controller: cubit.passwordController,
      hintText: context.l10n.passwordHint,
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

  Widget _buildConfirmPasswordField(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return CustomTextField(
      controller: cubit.confirmPasswordController,
      hintText: context.l10n.confirmPasswordHint,
      isPassword: true,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return context.l10n.confirmPasswordRequired;
        }

        if (value != cubit.passwordController.text) {
          return context.l10n.passwordsDoNotMatch;
        }

        return null;
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

  Widget _buildTermsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: AppSizes.w(24),
          height: AppSizes.h(24),
          child: Checkbox(
            value: _acceptedTerms,
            onChanged: (value) {
              setState(() {
                _acceptedTerms = value ?? false;
              });
            },
            activeColor: ColorsManager.primary,
            side: BorderSide(
              color: ColorsManager.primary40,
              width: AppSizes.w(1),
            ),
            visualDensity: VisualDensity.compact,
          ),
        ),
        SizedBox(width: AppSizes.w(6)),

        CustomText(
          text: context.l10n.agreeTo,
          style: context.textTheme.bodySmall!,
        ),

        SizedBox(width: AppSizes.w(4)),

        InkWell(
          onTap: () {},
          child: CustomText(
            text: context.l10n.termsAndConditions,
            style: context.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: ColorsManager.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) {
        return current is RegisterLoading ||
            current is RegisterSuccess ||
            current is RegisterError;
      },
      builder: (context, state) {
        return CustomButton(
          text: context.l10n.createAccount,
          isLoading: state is RegisterLoading,
          onPressed: _register,
          height: 50,
          borderRadius: 24,
          textStyle: context.textTheme.labelLarge,
        );
      },
    );
  }

  void _register() {
    if (!_acceptedTerms) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.termsRequired)));

      return;
    }

    context.read<RegisterCubit>().register();
  }

  Widget _buildLoginButton(BuildContext context) {
    return AccountSwitchButton(
      leadingText: context.l10n.alreadyHaveAccount,
      actionText: context.l10n.login,
      onPressed: () {
        context.pushNamed(AppRoutes.login);
      },
    );
  }
}
