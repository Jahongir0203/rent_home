import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/core/theme/app_lotties.dart';
import 'package:rent_home/core/utils/app_locale_keys.dart';
import 'package:rent_home/feature/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:rent_home/feature/presentation/pages/drawer_page/drawer_page.dart';
import 'package:rent_home/feature/presentation/pages/log_in_page/log_in_page.dart';
import 'package:rent_home/injection_container.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final bloc = sl<SplashBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc
        ..add(
          SplashLoadedEvent(),
        ),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccessState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DrawerPage(),
                ));
          }
        },
        child: Scaffold(
          body: Container(
            height: 100.sh,
            width: 100.sw,
            color: AppColors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AppLotties.home),
                  Text(
                    AppLocaleKeys.appName,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
