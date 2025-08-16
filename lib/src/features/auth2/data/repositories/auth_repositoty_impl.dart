import 'package:task_management/src/core/shared/text/exceptions.dart';
import 'package:task_management/src/core/shared/text/failure.dart';
import 'package:task_management/src/features/auth2/data/models/signup_model.dart';
import 'package:task_management/src/features/auth2/data/source/remote/auth_remote_data_source.dart';

import '../../domain/entites/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../models/login_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<dynamic, UserEntity>> loginWithEmailPassword({
    required LoginModel loginModel,
  }) async {
    try {
      final user = await _remoteDataSource.loginWithEmailPassword(
        loginModel: loginModel,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<dynamic, UserEntity>> signupWithEmailPassword({
    required SignUpModel signupModel,
  }) async {
    try {
      final user = await _remoteDataSource.signupWithEmailPassword(
        signupModel: signupModel,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
