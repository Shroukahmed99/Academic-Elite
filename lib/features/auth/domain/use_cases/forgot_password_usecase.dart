import 'package:injectable/injectable.dart';

@lazySingleton
class ForgotPasswordUseCase {
  Future<void> call({
    required String email,
  }) async {
    // Fake API delay
    await Future.delayed(
      const Duration(milliseconds: 800),
    );

    // Fake success
    // أي Email صحيح من ناحية الـ UI يعتبر Success
    return;
  }
}