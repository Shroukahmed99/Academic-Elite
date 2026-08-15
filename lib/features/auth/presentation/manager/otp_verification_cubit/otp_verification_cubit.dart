import 'package:academic_elite/features/auth/domain/use_cases/forgot_password_usecase.dart';
import 'package:academic_elite/features/auth/domain/use_cases/verify_otp_usecase.dart';
import 'package:academic_elite/features/auth/presentation/manager/otp_verification_cubit/otp_verification_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit({
    required this.verifyOtpUseCase,
    required this.forgotPasswordUseCase,
  }) : super(OtpVerificationInitial());

  final VerifyOtpUseCase verifyOtpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    emit(OtpVerificationLoading());

    final result = await verifyOtpUseCase(
      email: email,
      otp: otp,
    );

    result.fold(
      (failure) {
        emit(
          OtpVerificationError(
            failure: failure,
          ),
        );
      },
      (_) {
        emit(OtpVerificationSuccess());
      },
    );
  }

  Future<void> resendOtp({
    required String email,
  }) async {
    emit(OtpResendLoading());

    final result = await forgotPasswordUseCase(
      email: email,
    );

    result.fold(
      (failure) {
        emit(
          OtpResendError(
            failure: failure,
          ),
        );
      },
      (_) {
        emit(OtpResendSuccess());
      },
    );
  }
}