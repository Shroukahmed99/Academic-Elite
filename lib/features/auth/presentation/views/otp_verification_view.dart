import 'package:academic_elite/core/di/injection.dart';
import 'package:academic_elite/features/auth/presentation/manager/otp_verification_cubit/otp_verification_cubit.dart';
import 'package:academic_elite/features/auth/presentation/widgets/otp_verification_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OtpVerificationCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: OtpVerificationBody(
            email: email,
          ),
        ),
      ),
    );
  }
}