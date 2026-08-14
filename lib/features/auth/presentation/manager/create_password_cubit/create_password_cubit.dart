import 'package:academic_elite/features/auth/domain/use_cases/create_password_use_case.dart';
import 'package:academic_elite/features/auth/presentation/manager/create_password_cubit/create_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreatePasswordCubit
    extends Cubit<CreatePasswordState> {
  CreatePasswordCubit(
    this.createPasswordUseCase,
  ) : super(CreatePasswordInitial());

  final CreatePasswordUseCase createPasswordUseCase;

  Future<void> createPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(CreatePasswordLoading());

    try {
      await createPasswordUseCase.call(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );

      emit(CreatePasswordSuccess());
    } catch (e) {
      emit(
        CreatePasswordError(
          e.toString(),
        ),
      );
    }
  }
}