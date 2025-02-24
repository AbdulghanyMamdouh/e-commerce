import 'package:shopping_app/features/auth/domain/entities/register_response_entity/user_entity.dart';

class AuthResultEntity {
  UserEntity? user;
  String? token;

  AuthResultEntity({this.user, this.token});
}
