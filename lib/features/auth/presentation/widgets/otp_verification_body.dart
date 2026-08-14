import 'dart:async';

import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/custom_button.dart';
import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/extensions/navigation_extension.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/features/auth/presentation/manager/otp_verification_cubit/otp_verification_cubit.dart';
import 'package:academic_elite/features/auth/presentation/manager/otp_verification_cubit/otp_verification_state.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpVerificationBody extends StatefulWidget {
  const OtpVerificationBody({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<OtpVerificationBody> createState() => _OtpVerificationBodyState();
}

class _OtpVerificationBodyState extends State<OtpVerificationBody> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  Timer? _timer;

  int _remainingSeconds = 60;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      6,
      (_) => TextEditingController(),
    );

    _focusNodes = List.generate(
      6,
      (_) => FocusNode(),
    );

    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();

    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      title: 'التحقق من بريدك الإلكتروني',
      child: BlocListener<OtpVerificationCubit, OtpVerificationState>(
        listener: _handleState,
        child: Column(
          children: [
            SizedBox(height: AppSizes.h(28)),

            _buildEmailImage(),

            SizedBox(height: AppSizes.h(20)),

            _buildDescription(context),

            SizedBox(height: AppSizes.h(8)),

            _buildEmail(context),

            SizedBox(height: AppSizes.h(24)),

            _buildCodeTitle(context),

            SizedBox(height: AppSizes.h(8)),

            _buildOtpFields(context),

            SizedBox(height: AppSizes.h(20)),

            _buildVerifyButton(context),

            SizedBox(height: AppSizes.h(12)),

            _buildResendButton(context),

            SizedBox(height: AppSizes.h(30)),
          ],
        ),
      ),
    );
  }

  void _handleState(
    BuildContext context,
    OtpVerificationState state,
  ) {
    if (state is OtpVerificationSuccess) {
      context.pushNamed(
        AppRoutes.createNewPassword,
        arguments: widget.email,
      );
      return;
    }

    if (state is OtpVerificationError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
        ),
      );
    }
  }

  void _startTimer() {
    _timer?.cancel();

    setState(() {
      _remainingSeconds = 60;
    });

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingSeconds == 0) {
          timer.cancel();
          setState(() {});
          return;
        }

        setState(() {
          _remainingSeconds--;
        });
      },
    );
  }

  Widget _buildEmailImage() {
    return SizedBox(
      width: AppSizes.w(130),
      height: AppSizes.h(130),
      child: SvgPicture.asset(
        AssetsManager.emailImage,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return CustomText(
      text:
          'لقد أرسلنا إليك للتو رمزًا مكونًا من 6 أرقام عبر بريدك الإلكتروني:',
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.bodyMedium!,
    );
  }

  Widget _buildEmail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: AppSizes.w(24),
          height: AppSizes.h(24),
          decoration: BoxDecoration(
            color: ColorsManager.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.email_outlined,
            color: ColorsManager.white,
            size: AppSizes.sp(14),
          ),
        ),
        SizedBox(width: AppSizes.w(8)),
        Flexible(
          child: CustomText(
            text: widget.email,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: ColorsManager.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCodeTitle(BuildContext context) {
    return CustomText(
      text: 'أدخل الرمز',
      textAlign: TextAlign.center,
      style: context.textTheme.bodyMedium!,
    );
  }

  Widget _buildOtpFields(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          6,
          (index) => Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w(3),
            ),
            child: _buildOtpField(
              context,
              index,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpField(
    BuildContext context,
    int index,
  ) {
    final bool isFilled = _controllers[index].text.isNotEmpty;

    return SizedBox(
      width: AppSizes.w(44),
      height: AppSizes.h(56),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: context.textTheme.titleLarge!.copyWith(
          color: ColorsManager.primary,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: ColorsManager.background,
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.r16,
            ),
            borderSide: BorderSide(
              color: isFilled
                  ? ColorsManager.secondary
                  : ColorsManager.font5,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.r16,
            ),
            borderSide: BorderSide(
              color: ColorsManager.secondary,
              width: 1.5,
            ),
          ),
        ),
        onChanged: (value) {
          setState(() {});

          if (value.isNotEmpty && index < 5) {
            _focusNodes[index + 1].requestFocus();
          }

          if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }

  Widget _buildVerifyButton(BuildContext context) {
    return BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
      builder: (context, state) {
        return CustomButton(
          text: 'متابعة',
          isLoading: state is OtpVerificationLoading,
          onPressed: _verifyOtp,
          height: 50,
          borderRadius: 24,
          suffixIcon: Icon(
            Icons.arrow_back,
            color: ColorsManager.white,
            size: AppSizes.sp(20),
          ),
          textStyle: context.textTheme.titleMedium!.copyWith(
            color: ColorsManager.white,
          ),
        );
      },
    );
  }

  void _verifyOtp() {
    final String otp = _controllers
        .map((controller) => controller.text)
        .join();

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'من فضلك أدخل رمز التحقق كاملًا',
          ),
        ),
      );

      return;
    }

    context.read<OtpVerificationCubit>().verifyOtp(
      email: widget.email,
      otp: otp,
    );
  }

  Widget _buildResendButton(BuildContext context) {
    final bool canResend = _remainingSeconds == 0;

    return CustomButton.outlined(
      text: canResend
          ? 'إعادة الإرسال'
          : 'إعادة الإرسال بعد $_remainingSeconds ث',
      onPressed: canResend ? _resendCode : null,
      height: 50,
      borderRadius: 24,
      borderColor: ColorsManager.font4,
      textColor: ColorsManager.primary,
      textStyle: context.textTheme.titleSmall!.copyWith(
        color: ColorsManager.primary,
      ),
    );
  }

  void _resendCode() {
    context.read<OtpVerificationCubit>().resendOtp(
      email: widget.email,
    );

    _startTimer();
  }
}