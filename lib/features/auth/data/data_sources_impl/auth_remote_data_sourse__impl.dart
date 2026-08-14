import 'package:academic_elite/core/network/api_manager.dart';
import 'package:academic_elite/core/network/endpoints.dart';
import 'package:academic_elite/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiManager apiManager;

  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<void> login({required String email, required String password}) async {
    // TODO: Replace mock data with real API later.

    await Future.delayed(const Duration(milliseconds: 800));

    // Mock login credentials
    const mockEmail = 'test@gmail.com';
    const mockPassword = '123456';

    if (email == mockEmail && password == mockPassword) {
      return;
    }

    throw Exception('البريد الإلكتروني أو كلمة المرور غير صحيحة');
  }

  @override
  Future<void> createPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    // TODO: Replace mock data with real API later.

    await Future.delayed(const Duration(milliseconds: 800));

    if (password != confirmPassword) {
      throw Exception('كلمتا المرور غير متطابقتين');
    }

    // Mock success
    return;
  }

  // ============================================================
  // REGISTER - TEMPORARY FAKE DATA
  // ============================================================

  @override
  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    // Temporary fake request.
    // Replace this with the real API later.

    await Future.delayed(const Duration(seconds: 1));

    // Fake successful registration.
    return;
  }
}
