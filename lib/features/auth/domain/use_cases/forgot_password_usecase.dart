import 'package:academic_elite/core/errors/failures.dart';
import 'package:academic_elite/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:academic_elite/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  Future<Either<Failure, ForgotPasswordEntity>> call({
    required String email,
  }) {
    return repository.forgotPassword(
      email: email,
    );
  }
}