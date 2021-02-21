import 'package:company_task/presenter/scaffolds/button.dart';
import 'package:company_task/presenter/scaffolds/dialog_wrap.dart';
import 'package:company_task/presenter/scaffolds/text.dart';
import 'package:company_task/presenter/screens/login/login_screen.dart';
import 'package:company_task/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogOutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DialogWrap(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 60.h,
          ),
          Container(
            child: TitleText(
              "Are you sure you want to log out ?",
              textColor: AppColors.BLACK,
              fontWeight: FontWeight.w400,
              size: 35,
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ColorButton(
                    color: AppColors.BLUE,
                    textColor: AppColors.WHITE,
                    height: 40,
                    text: "No",
                    textSize: 35,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(
                  width: 40.w,
                ),
                Expanded(
                  child: ColorButton(
                    color: AppColors.BLUE,
                    textColor: AppColors.WHITE,
                    height: 40,
                    text: "Yes",
                    textSize: 35,
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
