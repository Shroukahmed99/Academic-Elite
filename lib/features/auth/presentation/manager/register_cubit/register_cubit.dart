import 'package:academic_elite/features/auth/domain/use_cases/register_usecase.dart';
import 'package:academic_elite/features/auth/presentation/manager/register_cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase)
      : super(RegisterInitial());

  final RegisterUseCase registerUseCase;

  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoading());

    try {
      await registerUseCase(
        name: name,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
      );

      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}