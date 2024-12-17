import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../bloc/home_bloc/home_bloc.dart';

class HomeFailureAppBarWidget extends StatelessWidget {
  const HomeFailureAppBarWidget({
    super.key,
    required this.state,
  });

  final HomeFailureState state;

  @override
  Widget build(BuildContext context) {
    return BounceInUp(
      child: Text(
        state.failure,
        style: const TextStyle(
            color: Colors.blue, fontSize: 30, fontWeight: FontWeight.w600),
      ),
    );
  }
}
