class VerifyOtpEntity {
  final String message;
  final String email;
  final String? token;

  const VerifyOtpEntity({
    required this.message,
    required this.email,
    this.token,
  });
}