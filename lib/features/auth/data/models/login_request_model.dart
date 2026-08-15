

import 'package:academic_elite/features/auth/data/models/user_model.dart';
import 'package:academic_elite/features/auth/domain/entities/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  const LoginResponseModel({
    required super.token,
    required super.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'] ?? '',
      user: UserModel.fromJson(
        json['user'] ?? {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': (user as UserModel).toJson(),
    };
  }
}