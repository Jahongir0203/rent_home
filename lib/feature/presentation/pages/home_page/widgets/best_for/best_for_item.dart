import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_home/core/extentions/padding_extension.dart';
import 'package:rent_home/feature/presentation/pages/home_page/widgets/best_for/widgets/best_for_title.dart';

class BestForItem extends StatelessWidget {
  const BestForItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: width * 0.2,
          width: width * 0.2,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: const DecorationImage(
                image: NetworkImage("https://t3.ftcdn.net/jpg/06/46/45/68/360_F_646456820_cbyaYswG5bMJLKsX0hKeOcvovNiKOSN7.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        20.getW(),
        const BestForTitle(),
      ],
    ).paddingSymmetric(vertical: 10.h);
  }
}
