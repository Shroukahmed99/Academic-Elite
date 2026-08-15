import 'package:academic_elite/core/errors/failures.dart';
import 'package:academic_elite/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:academic_elite/features/auth/domain/entities/register_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, RegisterResponseEntity>> call({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) {
    return repository.register(
      name: name,
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}