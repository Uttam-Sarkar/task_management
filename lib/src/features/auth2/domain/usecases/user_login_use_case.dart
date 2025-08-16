import 'package:fpdart/fpdart.dart';
import 'package:task_management/src/features/auth2/data/models/login_model.dart';
import 'package:task_management/src/features/auth2/domain/repositories/auth_repository.dart';

import '../entites/user_entity.dart';

class UserLoginUseCase {
  final AuthRepository _repo;

  UserLoginUseCase(this._repo);

  Future<Either<dynamic, UserEntity>> call({required LoginModel loginModel}) async {
    return _repo.loginWithEmailPassword(loginModel: loginModel);
  }
}
