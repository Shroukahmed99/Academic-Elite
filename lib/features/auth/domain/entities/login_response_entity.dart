import 'user_entity.dart';

class LoginResponseEntity {
  final String token;
  final UserEntity user;

  const LoginResponseEntity({
    required this.token,
    required this.user,
  });
}