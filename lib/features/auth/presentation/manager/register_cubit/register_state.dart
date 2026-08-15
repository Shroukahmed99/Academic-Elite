
import 'package:academic_elite/core/errors/failures.dart';
import 'package:academic_elite/features/auth/domain/entities/register_response_entity.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterResponseEntity response;

  RegisterSuccess({
    required this.response,
  });
}

class RegisterError extends RegisterState {
  final Failure failure;

  RegisterError({
    required this.failure,
  });
}