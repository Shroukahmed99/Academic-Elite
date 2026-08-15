import 'package:academic_elite/core/errors/exceptions.dart';
import 'package:academic_elite/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:academic_elite/features/auth/data/models/forgot_password_request_model.dart';
import 'package:academic_elite/features/auth/data/models/login_request_model.dart';
import 'package:academic_elite/features/auth/data/models/register_request_model.dart';
import 'package:academic_elite/features/auth/data/models/reset_password_request_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    );

    const mockEmail = 'test@gmail.com';
    const mockPassword = '123456';

    if (email != mockEmail || password != mockPassword) {
      throw UnauthorizedException();
    }

    final response = {
      'token': 'mock_token_123456',
      'user': {
        'id': '1',
        'fullName': 'أحمد محمد',
        'email': email,
        'phoneNumber': '01000000000',
      },
    };

    return LoginResponseModel.fromJson(response);
  }

  @override
  Future<ForgotPasswordModel> forgotPassword({
    required String email,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    );

    final response = {
      'message': 'تم إرسال رمز التحقق إلى بريدك الإلكتروني',
      'email': email,
    };

    return ForgotPasswordModel.fromJson(response);
  }

  @override
  Future<ResetPasswordModel> createPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    );

    if (password != confirmPassword) {
      throw BadRequestException();
    }

    final response = {
      'message': 'تم تغيير كلمة المرور بنجاح',
    };

    return ResetPasswordModel.fromJson(response);
  }

  @override
  Future<RegisterResponseModel> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (password != confirmPassword) {
      throw BadRequestException();
    }

    final response = {
      'message': 'تم إنشاء الحساب بنجاح',
      'user': {
        'id': '1',
        'fullName': name,
        'email': email,
        'phoneNumber': phone,
      },
      'token': 'mock_register_token',
    };

    return RegisterResponseModel.fromJson(response);
  }


  @override
Future<void> verifyOtp({
  required String email,
  required String otp,
}) async {
  await Future.delayed(
    const Duration(milliseconds: 800),
  );

  const correctOtp = '123456';

  if (otp != correctOtp) {
    throw BadRequestException();
  }
}
}