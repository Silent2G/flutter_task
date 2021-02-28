import 'package:company_task/ui/widgets/text.dart';
import 'package:company_task/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnPair extends StatelessWidget {
  final String title;
  final Widget child;

  ColumnPair({@required this.title, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w),
            width: MediaQuery.of(context).size.width,
            child: TitleText(
              title,
              textAlign: TextAlign.start,
              textColor: AppColors.BLACK,
              fontWeight: FontWeight.w400,
              size: 30,
            ),
          ),
          SizedBox(height: 10.h,),
          child,
        ],
      ),
    );
  }
}
