import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/custom_button.dart';
import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/components/custom_text_field.dart';
import 'package:academic_elite/core/extensions/localization_extension.dart';
import 'package:academic_elite/core/extensions/navigation_extension.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/core/validators/validation_helper.dart';
import 'package:academic_elite/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:academic_elite/features/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_divider.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_header.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  bool _acceptedTerms = false;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(
      text: 'محمود السيد',
    );
    _emailController = TextEditingController(
      text: 'test@gmail.com',
    );
    _phoneController = TextEditingController(
      text: '0791234567',
    );
    _passwordController = TextEditingController(
      text: 'Test@123456',
    );
    _confirmPasswordController = TextEditingController(
      text: 'Test@123456',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      title: context.l10n.createAccount,
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: _handleState,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AuthHeader(
                title: context.l10n.createAccount,
                description:
                    'أنشئ حسابك للوصول إلى الدورات والخدمات الأكاديمية.',
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
      ),
    );
  }

  void _handleState(
    BuildContext context,
    RegisterState state,
  ) {
    if (state is RegisterSuccess) {
      context.pushNamedAndRemoveUntil(
        AppRoutes.registerSuccess,
      );
      return;
    }

    if (state is RegisterError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
        ),
      );
    }
  }

  Widget _buildNameField(BuildContext context) {
    return CustomTextField(
      controller: _nameController,
      hintText: 'أدخل الاسم كامل',
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'من فضلك أدخل الاسم كامل';
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
    return CustomTextField(
      controller: _emailController,
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
    return CustomTextField(
      controller: _phoneController,
      hintText: 'أدخل رقم الهاتف',
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'من فضلك أدخل رقم الهاتف';
        }

        return null;
      },
      prefixIcon: Padding(
        padding: EdgeInsets.all(AppSizes.p14),
        child: SvgPicture.asset(
          AssetsManager.emojioneFlagJordan,
          width: AppSizes.sp(20),
          height: AppSizes.sp(20),
        ),
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return CustomTextField(
      controller: _passwordController,
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
    return CustomTextField(
      controller: _confirmPasswordController,
      hintText: 'تأكيد كلمة المرور',
      isPassword: true,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'من فضلك أكد كلمة المرور';
        }

        if (value != _passwordController.text) {
          return 'كلمتا المرور غير متطابقتين';
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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomText(
          text: 'أوافق على ',
          style: context.textTheme.bodySmall!,
        ),
        InkWell(
          onTap: () {},
          child: CustomText(
            text: 'الشروط والأحكام',
            style: context.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        SizedBox(width: AppSizes.w(6)),
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
      ],
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return CustomButton(
          text: context.l10n.createAccount,
          isLoading: state is RegisterLoading,
          onPressed: _register,
          height: 50,
          borderRadius: 24,
          textStyle: context.textTheme.titleMedium!.copyWith(
            color: ColorsManager.white,
          ),
        );
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomButton.outlined(
      text: 'لديك حساب بالفعل؟  تسجيل الدخول',
      onPressed: () {
        context.pushNamed(AppRoutes.login);
      },
      height: 50,
      borderRadius: 24,
      borderColor: ColorsManager.font4,
      textColor: ColorsManager.primary,
      textStyle: context.textTheme.titleSmall!.copyWith(
        color: ColorsManager.primary,
      ),
    );
  }

  void _register() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يجب الموافقة على الشروط والأحكام'),
        ),
      );

      return;
    }

    context.read<RegisterCubit>().register(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );
  }
}