import 'package:academic_elite/features/auth/presentation/manager/otp_verification_cubit/otp_verification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit() : super(OtpVerificationInitial());

  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    emit(OtpVerificationLoading());

    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    // Dummy OTP for UI testing
    if (otp == '123456') {
      emit(OtpVerificationSuccess());
    } else {
      emit(
        OtpVerificationError(
          'رمز التحقق غير صحيح',
        ),
      );
    }
  }

  Future<void> resendOtp({
    required String email,
  }) async {
    emit(OtpVerificationLoading());

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    emit(OtpVerificationResent());
  }
}