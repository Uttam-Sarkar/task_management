// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_management/src/features/auth2/data/models/login_model.dart';
import 'package:task_management/src/features/auth2/data/models/signup_model.dart';
import 'package:task_management/src/features/auth2/domain/entites/user_entity.dart';
import 'package:task_management/src/features/auth2/domain/usecases/user_signup_use_case.dart';

import '../../domain/usecases/user_login_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignupUseCase _userSignupUseCase;
  final UserLoginUseCase _userLoginUseCase;

  AuthBloc({
    required UserSignupUseCase userSignupUseCase,
    required UserLoginUseCase userLoginUseCase,
  }) : _userSignupUseCase = userSignupUseCase,
       _userLoginUseCase = userLoginUseCase,
       super(AuthInitial()) {
    on<AuthSignUp>(_signup);
    on<AuthLogin>(_login);
  }

  void _signup(event, emit) async {
    final response = await _userSignupUseCase(
      signupModel: SignUpModel(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    response.fold(
      (l) => emit(AuthFailure(l.failure)),
      (r) => emit(AuthSuccess(r)),
    );
  }

  void _login(event, emit) async {
    final response = await _userLoginUseCase(
      loginModel: LoginModel(email: event.email, password: event.password),
    );
    response.fold(
      (l) => emit(AuthFailure(l.failure)),
      (r) => emit(AuthSuccess(r)),
    );
  }
}
