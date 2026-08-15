
import 'package:academic_elite/core/errors/failures.dart';
import 'package:academic_elite/features/auth/domain/entities/forgot_password_entity.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final ForgotPasswordEntity response;

  ForgotPasswordSuccess({
    required this.response,
  });
}

class ForgotPasswordError extends ForgotPasswordState {
  final Failure failure;

  ForgotPasswordError({
    required this.failure,
  });
}