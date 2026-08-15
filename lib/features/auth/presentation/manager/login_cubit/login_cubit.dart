import 'package:academic_elite/features/auth/domain/use_cases/login_usecase.dart';
import 'package:academic_elite/features/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  final LoginUseCase loginUseCase;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(text: 'test@gmail.com');

  final passwordController = TextEditingController(text: 'Test@gmail123456');

  // Remember me
  bool rememberMe = false;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(LoginLoading());

    final result = await loginUseCase(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    result.fold(
      (failure) {
        emit(LoginError(failure: failure));
      },
      (response) {
        emit(LoginSuccess(loginResponseEntity: response));
      },
    );
  }

  void toggleRememberMe(bool value) {
    rememberMe = value;
    emit(RememberMeChanged(rememberMe: rememberMe));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
