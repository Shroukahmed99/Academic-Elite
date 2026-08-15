import 'package:academic_elite/core/errors/failures.dart';
import 'package:academic_elite/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:academic_elite/features/auth/domain/entities/login_response_entity.dart';
import 'package:academic_elite/features/auth/domain/entities/register_response_entity.dart';
import 'package:academic_elite/features/auth/domain/entities/reset_password_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, ForgotPasswordEntity>> forgotPassword({
    required String email,
  });

  Future<Either<Failure, ResetPasswordEntity>> createPassword({
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, RegisterResponseEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, void>> verifyOtp({
    required String email,
    required String otp,
  });
}