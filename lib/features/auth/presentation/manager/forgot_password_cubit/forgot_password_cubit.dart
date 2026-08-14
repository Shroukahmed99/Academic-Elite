import 'package:academic_elite/features/auth/domain/use_cases/forgot_password_usecase.dart';
import 'package:academic_elite/features/auth/presentation/manager/forgot_password_cubit/forgot_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.forgotPasswordUseCase)
      : super(ForgotPasswordInitial());

  final ForgotPasswordUseCase forgotPasswordUseCase;

  Future<void> forgotPassword({
    required String email,
  }) async {
    emit(ForgotPasswordLoading());

    try {
      await forgotPasswordUseCase(
        email: email,
      );

      emit(ForgotPasswordSuccess());
    } catch (e) {
      emit(ForgotPasswordError(e.toString()));
    }
  }
}