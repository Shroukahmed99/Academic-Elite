import 'package:academic_elite/core/errors/failures.dart';
import 'package:academic_elite/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:academic_elite/features/auth/domain/entities/login_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, LoginResponseEntity>> call({
    required String email,
    required String password,
  }) {
    return repository.login(
      email: email,
      password: password,
    );
  }
}