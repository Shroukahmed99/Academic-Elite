import 'dart:async';

import 'package:academic_elite/config/routes/app_routes.dart';
import 'package:academic_elite/core/components/custom_app_bar.dart';
import 'package:academic_elite/core/components/custom_button.dart';
import 'package:academic_elite/core/components/custom_text.dart';
import 'package:academic_elite/core/components/curved_page_layout.dart';
import 'package:academic_elite/core/errors/mappers/failure_to_message_mapper.dart';
import 'package:academic_elite/core/extensions/localization_extension.dart';
import 'package:academic_elite/core/extensions/navigation_extension.dart';
import 'package:academic_elite/core/extensions/theme_extension.dart';
import 'package:academic_elite/core/utils/app_sizes.dart';
import 'package:academic_elite/core/utils/assets_manager.dart';
import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/features/auth/presentation/manager/otp_verification_cubit/otp_verification_cubit.dart';
import 'package:academic_elite/features/auth/presentation/manager/otp_verification_cubit/otp_verification_state.dart';
import 'package:academic_elite/features/auth/presentation/widgets/auth_divider.dart';
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

  Timer? _resendTimer;
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

    _startResendTimer();
  }

  @override
  void dispose() {
    _resendTimer?.cancel();

    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  void _startResendTimer() {
    _resendTimer?.cancel();

    setState(() {
      _remainingSeconds = 44;
    });

    _resendTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingSeconds > 0) {
          setState(() {
            _remainingSeconds--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return CurvedPageLayout(
      bodyPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.p16,
      ),
      header: CustomAppBar(
        title: context.l10n.otpVerification,
        showBackButton: true,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: BlocListener<OtpVerificationCubit, OtpVerificationState>(
        listener: _handleState,
        child: _buildBody(context),
      ),
      scrollable: true,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizes.h(28)),

        _buildEmailImage(),

        SizedBox(height: AppSizes.h(20)),

        _buildDescription(context),

        SizedBox(height: AppSizes.h(8)),

        _buildEmail(context),

        SizedBox(height: AppSizes.h(20)),

        const AuthDivider(),

        SizedBox(height: AppSizes.h(20)),

        _buildOtpTitle(context),

        SizedBox(height: AppSizes.h(16)),

        _buildOtpFields(context),

        SizedBox(height: AppSizes.h(24)),

        _buildVerifyButton(context),

        SizedBox(height: AppSizes.h(12)),

        _buildResendButton(context),

        SizedBox(height: AppSizes.h(30)),
      ],
    );
  }

  Widget _buildEmailImage() {
    return SizedBox(
      width: AppSizes.w(110),
      height: AppSizes.h(110),
      child: SvgPicture.asset(
        AssetsManager.emailImage,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return CustomText(
      text: context.l10n.otpVerificationDescription,
      textAlign: TextAlign.center,
      style: context.textTheme.bodyMedium!.copyWith(
        color: ColorsManager.primary,
        fontSize: AppSizes.sp(14),
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
    );
  }

  Widget _buildEmail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: widget.email,
          style: context.textTheme.bodyLarge,
        ),
        SizedBox(width: AppSizes.w(8)),
        SvgPicture.asset(
          AssetsManager.editIcon,
        ),
      ],
    );
  }

  Widget _buildOtpTitle(BuildContext context) {
    return CustomText(
      text: context.l10n.enterVerificationCode,
      textAlign: TextAlign.center,
      style: context.textTheme.titleMedium!,
    );
  }

  Widget _buildOtpFields(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          6,
          (index) => _buildOtpField(context, index),
        ),
      ),
    );
  }

  Widget _buildOtpField(
    BuildContext context,
    int index,
  ) {
    return SizedBox(
      width: AppSizes.w(48),
      height: AppSizes.h(52),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: context.textTheme.titleLarge,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: ColorsManager.font6,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.r(12),
            ),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.r(12),
            ),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.r(12),
            ),
            borderSide: BorderSide(
              color: ColorsManager.primary,
              width: AppSizes.w(1),
            ),
          ),
        ),
        onChanged: (value) {
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
          text: context.l10n.verify,
          suffixIcon: Icon(
            context.isArabic
                ? Icons.arrow_forward
                : Icons.arrow_back,
            color: ColorsManager.white,
            size: AppSizes.sp(20),
          ),
          isLoading: state is OtpVerificationLoading,
          onPressed: _verifyOtp,
          height: 50,
          borderRadius: 24,
          textStyle: context.textTheme.titleMedium!.copyWith(
            color: ColorsManager.white,
          ),
        );
      },
    );
  }

  Widget _buildResendButton(BuildContext context) {
    final bool canResend = _remainingSeconds == 0;

    return InkWell(
      onTap: canResend
          ? () {
              context
                  .read<OtpVerificationCubit>()
                  .resendOtp(
                    email: widget.email,
                  );

              _startResendTimer();
            }
          : null,
      borderRadius: BorderRadius.circular(
        AppSizes.r(24),
      ),
      child: Container(
        width: double.infinity,
        height: AppSizes.h(50),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.p16,
        ),
        decoration: BoxDecoration(
          color: ColorsManager.background,
          borderRadius: BorderRadius.circular(
            AppSizes.r(24),
          ),
          border: Border.all(
            color: ColorsManager.font4,
            width: AppSizes.w(1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: AppSizes.w(20),
              height: AppSizes.w(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorsManager.primary,
                  width: AppSizes.w(1),
                ),
              ),
              alignment: Alignment.center,
              child: CustomText(
                text: '$_remainingSeconds',
                style: context.textTheme.labelMedium!.copyWith(
                  fontSize: AppSizes.sp(12),
                  color: canResend
                      ? ColorsManager.primary
                      : ColorsManager.font2,
                ),
              ),
            ),

            SizedBox(width: AppSizes.w(8)),

            CustomText(
              text: context.l10n.didNotReceiveCode,
              style: context.textTheme.labelSmall,
            ),

            SizedBox(width: AppSizes.w(8)),

            CustomText(
              text: context.l10n.resendCode,
              style: context.textTheme.labelMedium!.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: ColorsManager.primary,
                color: canResend
                    ? ColorsManager.primary
                    : ColorsManager.font4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyOtp() {
    final otp = _controllers
        .map((controller) => controller.text)
        .join();

    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.l10n.enterCompleteVerificationCode,
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
          content: Text(
            mapFailureToMessage(
              context,
              state.failure,
            ),
          ),
        ),
      );
    }
  }
}