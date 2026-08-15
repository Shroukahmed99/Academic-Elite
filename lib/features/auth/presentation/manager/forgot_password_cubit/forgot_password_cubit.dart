import 'package:academic_elite/features/auth/domain/use_cases/forgot_password_usecase.dart';
import 'package:academic_elite/features/auth/presentation/manager/forgot_password_cubit/forgot_password_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.forgotPasswordUseCase)
    : super(ForgotPasswordInitial());

  final ForgotPasswordUseCase forgotPasswordUseCase;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(text: 'test@gmail.com');

  Future<void> forgotPassword() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(ForgotPasswordLoading());

    final result = await forgotPasswordUseCase(
      email: emailController.text.trim(),
    );

    result.fold(
      (failure) {
        emit(ForgotPasswordError(failure: failure));
      },
      (response) {
        emit(ForgotPasswordSuccess(response: response));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
