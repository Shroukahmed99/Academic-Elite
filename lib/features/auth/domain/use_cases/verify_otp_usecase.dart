import 'package:academic_elite/core/errors/failures.dart';
import 'package:academic_elite/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String email,
    required String otp,
  }) {
    return repository.verifyOtp(
      email: email,
      otp: otp,
    );
  }
}