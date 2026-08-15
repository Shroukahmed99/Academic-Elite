
import 'package:academic_elite/core/errors/failures.dart';

abstract class OtpVerificationState {}

class OtpVerificationInitial extends OtpVerificationState {}

class OtpVerificationLoading extends OtpVerificationState {}

class OtpVerificationSuccess extends OtpVerificationState {}

class OtpVerificationError extends OtpVerificationState {
  final Failure failure;

  OtpVerificationError({
    required this.failure,
  });
}

class OtpResendLoading extends OtpVerificationState {}

class OtpResendSuccess extends OtpVerificationState {}

class OtpResendError extends OtpVerificationState {
  final Failure failure;

  OtpResendError({
    required this.failure,
  });
}