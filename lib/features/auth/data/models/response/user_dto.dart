import 'package:shopping_app/features/auth/domain/entities/register_response_entity/user_entity.dart';

class UserDTO {
  String? name;
  String? email;
  String? role;

  UserDTO({this.name, this.email, this.role});

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
        name: json['name'] as String?,
        email: json['email'] as String?,
        role: json['role'] as String?,
      );

  UserEntity toUserEntity() {
    return UserEntity(
      name: name!,
      email: email!,
      role: role!,
    );
  }
}
