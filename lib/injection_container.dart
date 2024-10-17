import 'package:get_it/get_it.dart';

import 'feature/presentation/bloc/splash_bloc/splash_bloc.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton<SplashBloc>(
    SplashBloc(),
  );
}
