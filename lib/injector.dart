import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:task_management/src/features/auth2/data/repositories/auth_repositoty_impl.dart';
import 'package:task_management/src/features/auth2/data/source/remote/auth_remote_data_source.dart';
import 'package:task_management/src/features/auth2/domain/repositories/auth_repository.dart';
import 'package:task_management/src/features/auth2/domain/usecases/user_login_use_case.dart';
import 'package:task_management/src/features/auth2/domain/usecases/user_signup_use_case.dart';
import 'package:task_management/src/features/auth2/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  // sl.registerSingleton(FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  //remote datasource
  sl.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  //repository
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(sl()));

  //use cases
  sl.registerFactory<UserSignupUseCase>(() => UserSignupUseCase(sl()));
  sl.registerFactory<UserLoginUseCase>(() => UserLoginUseCase(sl()));

  //Bloc
  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(userSignupUseCase: sl(), userLoginUseCase: sl()),
  );
}
