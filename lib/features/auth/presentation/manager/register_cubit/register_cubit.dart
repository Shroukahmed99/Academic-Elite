import 'package:academic_elite/features/auth/domain/use_cases/register_usecase.dart';
import 'package:academic_elite/features/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  final RegisterUseCase registerUseCase;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController(text: 'أحمد محمد');

  final emailController = TextEditingController(text: 'ahmed@gmail.com');

  final phoneController = TextEditingController(text: '01000000000');

  final passwordController = TextEditingController(text: 'Test@123456');

  final confirmPasswordController = TextEditingController(text: 'Test@123456');

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(RegisterLoading());

    final result = await registerUseCase(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );

    result.fold(
      (failure) {
        emit(RegisterError(failure: failure));
      },
      (response) {
        emit(RegisterSuccess(response: response));
      },
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    return super.close();
  }
}
