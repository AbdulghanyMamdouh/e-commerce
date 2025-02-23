import 'package:shopping_app/features/auth/domain/entities/register_response_entity/user_entity.dart';

class LoginResponseEntity {
  String? message;
  UserEntity? user;
  String? token;

  LoginResponseEntity({this.message, this.user, this.token});
}
