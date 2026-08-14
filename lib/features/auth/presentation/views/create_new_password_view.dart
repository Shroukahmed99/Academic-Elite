import 'package:academic_elite/core/di/injection.dart';
import 'package:academic_elite/features/auth/presentation/manager/create_password_cubit/create_password_cubit.dart';
import 'package:academic_elite/features/auth/presentation/widgets/create_new_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreatePasswordCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: CreatePasswordBody(
            email: email,
          ),
        ),
      ),
    );
  }
}