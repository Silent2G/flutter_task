import 'package:company_task/presenter/scaffolds/text.dart';
import 'package:company_task/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double width;
  final double height;
  final Function onPressed;
  final String text;
  final double borderRadius;
  final Color textColor;
  final FontWeight fontWeight;
  final double textSize;
  final double letterSpacing;

  const ColorButton(
      {Key key,
      this.child,
      this.color,
      this.width,
      this.height = 50,
      this.onPressed,
      this.borderRadius,
      this.text,
      this.fontWeight,
      this.textSize,
      this.letterSpacing,
      this.textColor = AppColors.WHITE})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius != null
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.circular(20.h),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: borderRadius != null
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.circular(20.h),
            onTap: onPressed,
            child: Center(
              child: child != null
                  ? child
                  : TitleText(
                      text,
                      textColor: textColor,
                      maxLines: 1,
                      fontWeight:
                          fontWeight != null ? fontWeight : FontWeight.w600,
                      letterSpacing:
                          letterSpacing != null ? letterSpacing : 1.2,
                      fontFamily: "Arial",
                      size: textSize,
                    ),
            )),
      ),
    );
  }
}
