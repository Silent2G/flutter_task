import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogWrap extends StatelessWidget {
  final Widget child;

  DialogWrap({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.h))),
          insetPadding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 80.w),
          child: child),
    );
  }
}
