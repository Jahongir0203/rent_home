import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/constants/constants.dart';
import 'package:rent_home/core/theme/app_colors.dart';
import 'package:rent_home/feature/presentation/bloc/drawer_page/drawer_bloc.dart';
import 'package:rent_home/feature/presentation/pages/drawer_page/widgets/alert_dialog_widget.dart';
import 'package:rent_home/feature/presentation/pages/drawer_page/widgets/drawer_widget.dart';

import '../../../../injection_container.dart';

class DrawerPage extends StatelessWidget {
  DrawerPage({super.key});

  final int selectedIndex = 0;
  final bloc = sl<DrawerBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<DrawerBloc, DrawerState>(
        listener: (context, state) {
          if (state is DrawerLogOutState) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialogWidget();
              },
            );
          }
        },
        builder: (context, state) {
          return AdvancedDrawer(
            controller: bloc.advancedDrawerController,
            backdropColor: AppColors.mainColor,
            animationCurve: Curves.easeInCubic,
            animationDuration: const Duration(milliseconds: 500),
            rtlOpening: false,
            disabledGestures: false,
            animateChildDecoration: true,
            childDecoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(30.r),
            ),
            drawer: DrawerWidget(
              selectedIndex:
                  state is DrawerSuccessState ? state.index : selectedIndex,
              bloc: bloc,
              state: state,
            ),
            child: state is DrawerSuccessState
                ? listPages[state.index]
                : listPages[selectedIndex],
          );
        },
      ),
    );
  }
}
