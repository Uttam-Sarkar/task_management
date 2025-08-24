import 'package:fpdart/fpdart.dart';
import 'package:task_management/src/core/shared/entites/user_entity.dart';
import 'package:task_management/src/features/auth/domain/repositories/auth_repository.dart';

class CurrentUserUseCase {
  final AuthRepository _repo;

  CurrentUserUseCase(this._repo);

  Future<Either<dynamic, UserEntity>> call(NoParams params) async {
    return await _repo.currentUser();
  }
}

class NoParams {}
