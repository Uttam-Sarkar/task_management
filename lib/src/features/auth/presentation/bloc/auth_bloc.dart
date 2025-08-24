// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_management/src/core/shared/cubits/app_user_cubit.dart';
import 'package:task_management/src/features/auth/data/models/login_model.dart';
import 'package:task_management/src/features/auth/data/models/signup_model.dart';
import 'package:task_management/src/features/auth/domain/usecases/current_user_use_case.dart';
import 'package:task_management/src/features/auth/domain/usecases/user_signup_use_case.dart';

import '../../../../core/shared/entites/user_entity.dart';
import '../../domain/usecases/user_login_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignupUseCase _userSignupUseCase;
  final UserLoginUseCase _userLoginUseCase;
  final AppUserCubit _appUserCubit; // its not an usecase
  final CurrentUserUseCase _currentUserUseCase;

  AuthBloc({
    required UserSignupUseCase userSignupUseCase,
    required UserLoginUseCase userLoginUseCase,
    required AppUserCubit appUserCubit,
    required CurrentUserUseCase currentUserUseCase,
  }) : _userSignupUseCase = userSignupUseCase,
       _userLoginUseCase = userLoginUseCase,
       _appUserCubit = appUserCubit,
       _currentUserUseCase = currentUserUseCase,
       super(AuthInitial()) {
    on<AuthSignUp>(_onSignUp);
    on<AuthLogin>(_onLogin);
    on<AuthIsUserLoggedIn>(_onIsUserLoggedIn);
  }

  void _emitAuthSuccess(UserEntity userEntity, emit) {
    _appUserCubit.updateUser(userEntity);
    emit(AuthSuccess(userEntity));
  }

  void _onIsUserLoggedIn(event, emit) async {
    final response = await _currentUserUseCase(NoParams());
    response.fold(
      (l) {
        print("User not logged in: ${l.failure}");

        emit(AuthFailure(l.failure));
      },
      (r) {
        print(r.email);
        print(r.name);
        print("Uttam");
        print(r.id);
        emit(AuthSuccess(r));

      }
    );
  }

  void _onSignUp(event, emit) async {
    emit(AuthLoading());
    final response = await _userSignupUseCase(
      signupModel: SignUpModel(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    response.fold(
      (l) => emit(AuthFailure(l.failure)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _onLogin(event, emit) async {
    emit(AuthLoading());
    final response = await _userLoginUseCase(
      loginModel: LoginModel(email: event.email, password: event.password),
    );
    response.fold(
      (l) => emit(AuthFailure(l.failure)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }
}
