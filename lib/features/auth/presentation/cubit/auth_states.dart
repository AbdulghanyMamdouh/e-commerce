import 'package:shopping_app/features/auth/domain/entities/auth_result_entity.dart';

class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginStateLoading extends AuthStates {}

class LoginStateSuccess extends AuthStates {
  AuthResultEntity authResultEntity;
  LoginStateSuccess({required this.authResultEntity});
}

class LoginStateError extends AuthStates {
  String? errorMessage;

  LoginStateError({this.errorMessage});
}

class RegisterStateLoading extends AuthStates {}

class RegisterStateSuccess extends AuthStates {
  AuthResultEntity authResultEntity;
  RegisterStateSuccess({required this.authResultEntity});
}

class RegisterStateError extends AuthStates {
  String? errorMessage;
  RegisterStateError({this.errorMessage});
}
