import 'package:company_task/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShadowWrap extends StatelessWidget {
  final Widget child;

  ShadowWrap({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.h)),
            boxShadow: [
              BoxShadow(
                color: AppColors.GREY,
                spreadRadius: 5,
                blurRadius: 7,
              )
            ]),
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColors.WHITE,
              borderRadius: BorderRadius.all(Radius.circular(20.h)),
            ),
            child: child));
  }
}
