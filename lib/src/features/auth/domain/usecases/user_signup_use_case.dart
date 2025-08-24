import 'package:fpdart/fpdart.dart';
import 'package:task_management/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:task_management/src/features/auth/data/models/signup_model.dart';

import '../../../../core/shared/entites/user_entity.dart';

class UserSignupUseCase {
  final AuthRepository _repo;

  const UserSignupUseCase(this._repo);

  Future<Either<dynamic, UserEntity>> call({
    required SignUpModel signupModel,
  }) async {
    return _repo.signupWithEmailPassword(signupModel: signupModel);
  }
}
