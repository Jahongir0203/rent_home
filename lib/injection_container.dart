import 'package:get_it/get_it.dart';
import 'package:rent_home/feature/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:rent_home/feature/presentation/bloc/log_In_bloc/log_in_bloc.dart';
import 'package:rent_home/feature/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';

import 'feature/presentation/bloc/splash_bloc/splash_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton<SplashBloc>(SplashBloc());
  sl.registerSingleton<LogInBloc>(LogInBloc());
  sl.registerSingleton<SignUpBloc>(SignUpBloc());
  sl.registerSingleton<ForgotPasswordBloc>(ForgotPasswordBloc());
}
