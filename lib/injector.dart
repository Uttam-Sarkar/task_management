import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:task_management/src/core/shared/cubits/app_user_cubit.dart';
import 'package:task_management/src/core/shared/networks/internet_connection_checker.dart';
import 'package:task_management/src/features/auth/data/repositories/auth_repositoty_impl.dart';
import 'package:task_management/src/features/auth/data/source/remote/auth_remote_data_source.dart';
import 'package:task_management/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:task_management/src/features/auth/domain/usecases/current_user_use_case.dart';
import 'package:task_management/src/features/auth/domain/usecases/user_login_use_case.dart';
import 'package:task_management/src/features/auth/domain/usecases/user_signup_use_case.dart';
import 'package:task_management/src/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initialize() async {
  // sl.registerSingleton(FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // sl.registerLazySingleton(() => InternetConnectionChecker());
  // sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionCheckerImpl(sl()));
  // Internet connection checker
  sl.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionCheckerImpl(InternetConnection()),
  );
  sl.registerLazySingleton<AppUserCubit>(() => AppUserCubit());

  //remote datasource
  sl.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  //repository
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(sl(), sl()));

  //use cases
  sl.registerFactory<UserSignupUseCase>(() => UserSignupUseCase(sl()));
  sl.registerFactory<UserLoginUseCase>(() => UserLoginUseCase(sl()));
  sl.registerFactory<CurrentUserUseCase>(() => CurrentUserUseCase(sl()));

  //Bloc
  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      userSignupUseCase: sl(),
      userLoginUseCase: sl(),
      appUserCubit: sl(),
      currentUserUseCase: sl(),
    ),
  );
}
