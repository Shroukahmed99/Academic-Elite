import 'package:academic_elite/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<void> call({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    await repository.register(
      name: name,
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}