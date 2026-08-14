abstract class OtpVerificationState {}

class OtpVerificationInitial extends OtpVerificationState {}

class OtpVerificationLoading extends OtpVerificationState {}

class OtpVerificationSuccess extends OtpVerificationState {}

class OtpVerificationError extends OtpVerificationState {
  OtpVerificationError(this.message);

  final String message;
}

class OtpVerificationResent extends OtpVerificationState {}