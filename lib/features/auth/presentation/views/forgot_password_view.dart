import 'package:academic_elite/core/di/injection.dart';
import 'package:academic_elite/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:academic_elite/features/auth/presentation/widgets/forgot_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgotPasswordCubit>(),
      child: const Scaffold(
        body: SafeArea(
          child: ForgotPasswordBody(),
        ),
      ),
    );
  }
}