import 'package:fpdart/fpdart.dart';
import 'package:task_management/src/features/auth2/data/models/signup_model.dart';
import 'package:task_management/src/features/auth2/domain/entites/user_entity.dart';

import '../../data/models/login_model.dart';

abstract interface class AuthRepository {
  Future<Either<dynamic, UserEntity>> signupWithEmailPassword({
    required SignUpModel signupModel,
  });

  Future<Either<dynamic, UserEntity>> loginWithEmailPassword({
    required LoginModel loginModel,
  });
}
