import 'package:fpdart/fpdart.dart';
import 'package:task_management/src/features/auth/data/models/signup_model.dart';

import '../../../../core/shared/entites/user_entity.dart';
import '../../data/models/login_model.dart';

abstract interface class AuthRepository {
  Future<Either<dynamic, UserEntity>> currentUser();

  Future<Either<dynamic, UserEntity>> signupWithEmailPassword({
    required SignUpModel signupModel,
  });

  Future<Either<dynamic, UserEntity>> loginWithEmailPassword({
    required LoginModel loginModel,
  });
}
