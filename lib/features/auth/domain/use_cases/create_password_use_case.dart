import 'package:academic_elite/core/errors/failures.dart';
import 'package:academic_elite/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:academic_elite/features/auth/domain/entities/reset_password_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreatePasswordUseCase {
  final AuthRepository repository;

  CreatePasswordUseCase(this.repository);

  Future<Either<Failure, ResetPasswordEntity>> call({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return repository.createPassword(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}