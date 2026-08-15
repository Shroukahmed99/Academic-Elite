import 'package:academic_elite/features/auth/data/models/forgot_password_request_model.dart';
import 'package:academic_elite/features/auth/data/models/login_request_model.dart';
import 'package:academic_elite/features/auth/data/models/register_request_model.dart';
import 'package:academic_elite/features/auth/data/models/reset_password_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  });

  Future<ForgotPasswordModel> forgotPassword({
    required String email,
  });

  Future<ResetPasswordModel> createPassword({
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<RegisterResponseModel> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  });

   Future<void> verifyOtp({
    required String email,
    required String otp,
  });
}