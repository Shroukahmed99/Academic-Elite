import 'package:academic_elite/features/auth/domain/use_cases/create_password_use_case.dart';
import 'package:academic_elite/features/auth/presentation/manager/create_password_cubit/create_password_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit(this.createPasswordUseCase)
    : super(CreatePasswordInitial());

  final CreatePasswordUseCase createPasswordUseCase;

  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController(text: 'Test@123456');

  final confirmPasswordController = TextEditingController(text: 'Test@123456');

  Future<void> createPassword({required String email}) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(CreatePasswordLoading());

    final result = await createPasswordUseCase(
      email: email,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    result.fold(
      (failure) {
        emit(CreatePasswordError(failure: failure));
      },
      (response) {
        emit(CreatePasswordSuccess(response: response));
      },
    );
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();

    return super.close();
  }
}
