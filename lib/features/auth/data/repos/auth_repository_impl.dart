import 'package:academic_elite/core/errors/failures.dart';
import 'package:academic_elite/core/network/network_info.dart';
import 'package:academic_elite/core/repository/base_repository.dart';
import 'package:academic_elite/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:academic_elite/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:academic_elite/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:academic_elite/features/auth/domain/entities/login_response_entity.dart';
import 'package:academic_elite/features/auth/domain/entities/register_response_entity.dart';
import 'package:academic_elite/features/auth/domain/entities/reset_password_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepository
    implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(
    this.remoteDataSource,
    NetworkInfo networkInfo,
  ) : super(networkInfo);

  @override
  Future<Either<Failure, LoginResponseEntity>> login({
    required String email,
    required String password,
  }) {
    return execute(
      () => remoteDataSource.login(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, ForgotPasswordEntity>> forgotPassword({
    required String email,
  }) {
    return execute(
      () => remoteDataSource.forgotPassword(
        email: email,
      ),
    );
  }

  @override
  Future<Either<Failure, ResetPasswordEntity>> createPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return execute(
      () => remoteDataSource.createPassword(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
  }

  @override
  Future<Either<Failure, RegisterResponseEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) {
    return execute(
      () => remoteDataSource.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
  }

  @override
  Future<Either<Failure, void>> verifyOtp({
    required String email,
    required String otp,
  }) {
    return execute(
      () => remoteDataSource.verifyOtp(
        email: email,
        otp: otp,
      ),
    );
  }
}