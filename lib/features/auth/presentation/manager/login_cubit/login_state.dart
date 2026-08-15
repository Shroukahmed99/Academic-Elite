import 'package:academic_elite/core/errors/failures.dart';
import 'package:academic_elite/features/auth/domain/entities/login_response_entity.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseEntity loginResponseEntity;

  LoginSuccess({required this.loginResponseEntity});
}

class LoginError extends LoginState {
  final Failure failure;

  LoginError({required this.failure});
}

class RememberMeChanged extends LoginState {
  final bool rememberMe;

  RememberMeChanged({required this.rememberMe});
}
