import 'package:academic_elite/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:academic_elite/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> login({required String email, required String password}) {
    return remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<void> createPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    await remoteDataSource.createPassword(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    await remoteDataSource.register(
      name: name,
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
