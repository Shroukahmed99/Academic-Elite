import 'package:academic_elite/core/di/injection.dart';
import 'package:academic_elite/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:academic_elite/features/auth/presentation/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterCubit>(),
      child: const Scaffold(
        body: RegisterBody(),
      ),
    );
  }
}