import 'package:academic_elite/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> call({
    required String email,
    required String password,
  }) {
    return repository.login(
      email: email,
      password: password,
    );
  }
}