import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_management/src/core/shared/networks/internet_connection_checker.dart';
import 'package:task_management/src/core/shared/text/exceptions.dart';
import 'package:task_management/src/core/shared/text/failure.dart';
import 'package:task_management/src/features/auth/data/models/signup_model.dart';
import 'package:task_management/src/features/auth/data/source/remote/auth_remote_data_source.dart';

import '../../../../core/shared/entites/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../models/login_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final InternetConnectionChecker internetConnectionChecker;

  const AuthRepositoryImpl(
    this._remoteDataSource,
    this.internetConnectionChecker,
  );

  @override
  Future<Either<dynamic, UserEntity>> currentUser() async {
    try {
      final user = await _remoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure("User Not Login"));
      } else {
        return right(user);
      }
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<dynamic, UserEntity>> loginWithEmailPassword({
    required LoginModel loginModel,
  }) async {
    try {
      if (!await internetConnectionChecker.isConnected) {
        throw Failure("No Internet Connection");
      }
      final user = await _remoteDataSource.loginWithEmailPassword(
        loginModel: loginModel,
      );
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message!));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<dynamic, UserEntity>> signupWithEmailPassword({
    required SignUpModel signupModel,
  }) async {
    try {
      if (!await internetConnectionChecker.isConnected) {
        throw Failure("No Internet Connection");
      }
      final user = await _remoteDataSource.signupWithEmailPassword(
        signupModel: signupModel,
      );
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(Failure(e.message!));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
