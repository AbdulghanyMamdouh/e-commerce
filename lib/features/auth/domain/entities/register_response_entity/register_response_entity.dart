import 'user_entity.dart';

class RegisterResponseEntity {
  String? message;
  UserEntity? user;
  String? token;

  RegisterResponseEntity({
    this.message,
    this.user,
    this.token,
  });
}
