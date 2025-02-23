import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/auth/domain/usecase/auth_use_case.dart';
import 'package:shopping_app/features/auth/presentation/cubit/auth_states.dart';

class AuthViewModel extends Cubit<AuthStates> {
  AuthViewModel({
    required this.authUseCase,
  }) : super(AuthInitialState());

  AuthUseCase authUseCase;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterStateLoading());
      var either = await authUseCase.register(nameController.text,
          emailController.text, passwordController.text, phoneController.text);
      either.fold((ifLeft) {
        emit(RegisterStateError(errorMessage: ifLeft.errorMessage));
      }, (response) {
        emit(RegisterStateSuccess(authResultEntity: response));
      });
    }
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginStateLoading());
      var either = await authUseCase.login(
          emailController.text, passwordController.text);
      either.fold((l) {
        emit(LoginStateError(errorMessage: l.errorMessage));
      }, (response) {
        emit(LoginStateSuccess(authResultEntity: response));
      });
    }
  }
}
