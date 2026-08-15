
import 'package:academic_elite/core/errors/failures.dart';
import 'package:academic_elite/features/auth/domain/entities/reset_password_entity.dart';

abstract class CreatePasswordState {}

class CreatePasswordInitial extends CreatePasswordState {}

class CreatePasswordLoading extends CreatePasswordState {}

class CreatePasswordSuccess extends CreatePasswordState {
  final ResetPasswordEntity response;

  CreatePasswordSuccess({
    required this.response,
  });
}

class CreatePasswordError extends CreatePasswordState {
  final Failure failure;

  CreatePasswordError({
    required this.failure,
  });
}