import 'package:academic_elite/core/di/injection.dart';
import 'package:academic_elite/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:academic_elite/features/auth/presentation/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: const Scaffold(
        body: LoginBody(),
      ),
    );
  }
}