import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/src/core/shared/entites/user_entity.dart';
import 'package:flutter/material.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AuthUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(UserEntity? userEntity) {

    if(userEntity == null){
      emit(AppUserInitial());
    }else{
      AppUserLoggedIn(userEntity);
    }
  }
}
