
import 'package:academic_elite/features/auth/domain/entities/verify_otp_entity.dart';

class VerifyOtpModel extends VerifyOtpEntity {
  const VerifyOtpModel({
    required super.message,
    required super.email,
    super.token,
  });

  factory VerifyOtpModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return VerifyOtpModel(
      message: json['message'] ?? '',
      email: json['email'] ?? '',
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'email': email,
      'token': token,
    };
  }
}