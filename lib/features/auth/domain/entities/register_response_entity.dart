import 'user_entity.dart';

class RegisterResponseEntity {
  final String message;
  final UserEntity user;
  final String? token;

  const RegisterResponseEntity({
    required this.message,
    required this.user,
    this.token,
  });
}