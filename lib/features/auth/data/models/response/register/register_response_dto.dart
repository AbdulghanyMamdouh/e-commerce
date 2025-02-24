import 'package:shopping_app/features/auth/data/models/response/register/errors.dart';
import 'package:shopping_app/features/auth/domain/entities/auth_result_entity.dart';

import '../user_dto.dart';

class RegisterResponseDTO {
  String? message;
  UserDTO? user;
  String? token;
  Errors? errors;

  RegisterResponseDTO({this.message, this.user, this.token, this.errors});

  factory RegisterResponseDTO.fromJson(Map<String, dynamic> json) {
    return RegisterResponseDTO(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
    );
  }
  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(
      token: token,
      user: user?.toUserEntity(),
    );
  }
}
