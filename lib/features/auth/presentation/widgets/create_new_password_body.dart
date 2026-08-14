import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/custom_button.dart';
import 'package:academic_elite/core/components/custom_text_field.dart';
import 'package:academic_elite/core/extensions/navigation_extension.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/core/validators/validation_helper.dart';
import 'package:academic_elite/features/auth/presentation/manager/create_password_cubit/create_password_cubit.dart';
import 'package:academic_elite/features/auth/presentation/manager/create_password_cubit/create_password_state.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_divider.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_header.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatePasswordBody extends StatefulWidget {
  const CreatePasswordBody({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<CreatePasswordBody> createState() => _CreatePasswordBodyState();
}

class _CreatePasswordBodyState extends State<CreatePasswordBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();

    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      title: 'كلمة مرور جديدة',
      child: BlocListener<CreatePasswordCubit, CreatePasswordState>(
        listener: _handleState,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AuthHeader(
                title: 'استعادة كلمة المرور',
                description:
                    'أدخل كلمة مرور جديدة وقوية لحماية حسابك.',
              ),

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

  void _handleState(
    BuildContext context,
    CreatePasswordState state,
  ) {
    if (state is CreatePasswordSuccess) {
      context.pushNamedAndRemoveUntil(
        AppRoutes.login,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم تغيير كلمة المرور بنجاح'),
        ),
      );

      return;
    }

    if (state is CreatePasswordError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
        ),
      );
    }
  }

  Widget _buildPasswordField(BuildContext context) {
    return CustomTextField(
      controller: _passwordController,
      hintText: 'كلمة المرور الجديدة',
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
      hintText: 'تأكيد كلمة المرور الجديدة',
      isPassword: true,
      textInputAction: TextInputAction.done,
      validator: (value) {
        final passwordError =
            ValidationHelper.validatePassword(value);

        if (passwordError != null) {
          return passwordError;
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

  Widget _buildSaveButton(BuildContext context) {
    return BlocBuilder<CreatePasswordCubit, CreatePasswordState>(
      builder: (context, state) {
        return CustomButton(
          text: 'حفظ وتسجيل الدخول',
          height: 50,
          borderRadius: 24,
          isLoading: state is CreatePasswordLoading,
          onPressed: _savePassword,
          textStyle: context.textTheme.titleMedium!.copyWith(
            color: ColorsManager.white,
          ),
        );
      },
    );
  }

  void _savePassword() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<CreatePasswordCubit>().createPassword(
      email: widget.email,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );
  }
}