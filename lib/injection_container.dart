import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rent_home/core/network/network_info.dart';
import 'package:rent_home/core/services/storage_service.dart';
import 'package:rent_home/feature/data/datasource/auth_datasource/auth_data_source.dart';
import 'package:rent_home/feature/data/datasource/home_datasource/home_data_source.dart';
import 'package:rent_home/feature/data/repository/auth_repository_impl/auth_repository_impl.dart';
import 'package:rent_home/feature/data/repository/house_repository_impl/house_repository_impl.dart';
import 'package:rent_home/feature/domain/repository/auth_repository/auth_repository.dart';
import 'package:rent_home/feature/domain/repository/house_repository/house_repository.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/forgot_password_use_case.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/log_in_use_case.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/log_out_use_case.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/refresh_token_use_case.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/register_user__use_case.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/reset_password_use_case.dart';
import 'package:rent_home/feature/domain/usecase/auth_usecase/validate_token_use_case.dart';
import 'package:rent_home/feature/presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:rent_home/feature/presentation/bloc/drawer_page/drawer_bloc.dart';
import 'package:rent_home/feature/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:rent_home/feature/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:rent_home/feature/presentation/bloc/log_In_bloc/log_in_bloc.dart';
import 'package:rent_home/feature/presentation/bloc/log_out_bloc/log_out_bloc.dart';
import 'package:rent_home/feature/presentation/bloc/reset_password_bloc/reset_password_bloc.dart';
import 'package:rent_home/feature/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';

import 'feature/presentation/bloc/splash_bloc/splash_bloc.dart';

final sl = GetIt.instance;

void init() {
  ///Bloc
  sl.registerFactory<SplashBloc>(() => SplashBloc());
  sl.registerFactory<LogInBloc>(() => LogInBloc(useCase: sl.call()));
  sl.registerFactory<SignUpBloc>(
      () => SignUpBloc(signUpUserUseCase: sl.call()));
  sl.registerFactory<ForgotPasswordBloc>(
      () => ForgotPasswordBloc(useCase: sl.call()));

  sl.registerFactory(() => ResetPasswordBloc(useCase: sl.call()));
  sl.registerFactory(() => DrawerBloc());
  sl.registerFactory(
      () => HomeBloc(houseRepository: sl(), storageService: sl()));
  sl.registerFactory(() => LogOutBloc(useCase: sl.call()));
  sl.registerFactory(() => DetailBloc());

  ///UseCase
  sl.registerLazySingleton(() => ForgotPasswordUseCase(sl()));
  sl.registerLazySingleton<LogInUseCase>(() => LogInUseCase(sl()));
  sl.registerLazySingleton(() => LogOutUseCase(sl()));
  sl.registerLazySingleton(() => RefreshTokenUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUserUseCase(sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));
  sl.registerLazySingleton(() => ValidateTokenUseCase(sl()));

  ///Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authDataSource: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<HouseRepository>(() => HouseRepositoryImpl(
        networkInfo: sl(),
        houseDataSource: sl(),
      ));

  ///DataSource
  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
  sl.registerLazySingleton<HouseDataSource>(
    () => HouseDataSourceImpl(),
  );

  ///Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///External
  sl.registerLazySingleton(() => InternetConnectionChecker());

  ///Service
  sl.registerSingleton<StorageService>(StorageService());

  /// Dio
  sl.registerSingleton<Dio>(
    Dio(),
  );
}
