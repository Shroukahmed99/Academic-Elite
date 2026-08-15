
import 'package:academic_elite/features/auth/domain/entities/forgot_password_entity.dart';

class ForgotPasswordModel extends ForgotPasswordEntity {
  const ForgotPasswordModel({
    required super.message,
    required super.email,
  });

  factory ForgotPasswordModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ForgotPasswordModel(
      message: json['message'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'email': email,
    };
  }
}