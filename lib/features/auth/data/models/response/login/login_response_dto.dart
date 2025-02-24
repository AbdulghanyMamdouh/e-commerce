import 'package:shopping_app/features/auth/data/models/response/user_dto.dart';
import 'package:shopping_app/features/auth/domain/entities/auth_result_entity.dart';

class LoginResponseDTO {
  String? message;
  UserDTO? user;
  String? token;

  LoginResponseDTO({this.message, this.user, this.token});

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) =>
      LoginResponseDTO(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );
  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(
      token: token,
      user: user?.toUserEntity(),
    );
  }
}
