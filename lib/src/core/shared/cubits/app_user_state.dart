part of 'app_user_cubit.dart';

@immutable
sealed class AuthUserState {}

final class AppUserInitial extends AuthUserState {}

final class AppUserLoggedIn extends AuthUserState{
  final UserEntity userEntity;
  AppUserLoggedIn(this.userEntity);

}