import 'package:academic_elite/features/auth/data/models/user_model.dart';
import 'package:academic_elite/features/auth/domain/entities/register_response_entity.dart';


class RegisterResponseModel extends RegisterResponseEntity {
  const RegisterResponseModel({
    required super.message,
    required super.user,
    super.token,
  });

  factory RegisterResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return RegisterResponseModel(
      message: json['message'] ?? '',
      user: UserModel.fromJson(
        json['user'] ?? {},
      ),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': (user as UserModel).toJson(),
      'token': token,
    };
  }
}