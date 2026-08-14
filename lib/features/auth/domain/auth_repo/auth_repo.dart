abstract class AuthRepository {
  Future<void> login({required String email, required String password});

  Future<void> createPassword({
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  });
}
