import 'package:academic_elite/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreatePasswordUseCase {
  CreatePasswordUseCase(this.repository);

  final AuthRepository repository;

  Future<void> call({
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