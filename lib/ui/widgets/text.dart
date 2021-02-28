import 'package:company_task/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText extends StatelessWidget {
  final String title;
  final double size;
  final Color textColor;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final FontWeight fontWeight;
  final String fontFamily;
  final double letterSpacing;
  final TextDecoration textDecoration;
  final double height;

  const TitleText(this.title,
      {this.textColor,
      this.size = 24,
      this.textAlign = TextAlign.center,
      this.overflow = TextOverflow.clip,
      this.maxLines,
      this.fontWeight,
      this.fontFamily,
      this.textDecoration,
      this.letterSpacing,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
            color: (textColor == null) ? AppColors.BLACK : textColor,
            fontSize: size.sp,
            height: height,
            decoration: textDecoration,
            letterSpacing: letterSpacing,
            fontStyle: FontStyle.normal,
            fontFamily: fontFamily != null ? fontFamily : "Arial",
            fontWeight: fontWeight));
  }
}

class InputTextField extends StatelessWidget {
  final String hint;
  final double size;
  final Color textColor;
  final bool obscureText;
  final String fontFamily;
  final TextEditingController textEditingController;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final FontWeight fontWeight;
  final String labelText;
  final int minLines;
  final int maxLines;
  final TextStyle labelStyle;
  final TextInputFormatter textInputFormatter;
  final FormFieldValidator<String> validator;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final Function(String) onSaved;
  final TextStyle hintTextStyle;
  final UnderlineInputBorder underlineInputBorder;
  final TextInputType textInputType;
  final FocusNode node;

  InputTextField({
    this.hint,
    this.size,
    this.textColor,
    this.obscureText,
    this.fontFamily,
    this.textEditingController,
    this.prefixIcon,
    this.suffixIcon,
    this.fontWeight,
    this.labelText,
    this.minLines,
    this.maxLines,
    this.labelStyle,
    this.textInputFormatter,
    this.validator,
    this.textInputAction,
    this.onChanged,
    this.onSaved,
    this.hintTextStyle,
    this.underlineInputBorder,
    this.textInputType,
    this.node,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: textEditingController,
        minLines: minLines,
        maxLines: maxLines,
        autocorrect: false,
        autofocus: true,
        textCapitalization: TextCapitalization.none,
        textInputAction:
            textInputAction != null ? textInputAction : TextInputAction.next,
        onEditingComplete: () => node.nextFocus(),
        obscureText: obscureText != null ? obscureText : false,
        keyboardType:
            textInputType != null ? textInputType : TextInputType.text,
        validator: validator,
        style: TextStyle(
            fontFamily: fontFamily != null ? fontFamily : "Arial",
            fontSize: size.sp,
            fontWeight: fontWeight != null ? fontWeight : FontWeight.w400,
            color: textColor != null ? textColor : AppColors.BLACK),
        inputFormatters:
            textInputFormatter != null ? [textInputFormatter] : null,
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderSide: BorderSide(width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(20.h),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.h)),
            borderSide: BorderSide(width: 1.0, color: AppColors.BLUE),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.h)),
            borderSide: BorderSide(width: 1.0, color: AppColors.RED),
          ),
          hintText: hint,
          contentPadding: EdgeInsets.only(left: 15.w, right: 15.w),
          labelText: labelText,
          labelStyle: labelStyle != null
              ? labelStyle
              : TextStyle(
                  fontFamily: fontFamily != null ? fontFamily : "Arial",
                  fontSize: size.sp,
                  fontWeight: fontWeight != null ? fontWeight : FontWeight.w400,
                  color: textColor != null ? textColor : AppColors.GREY),
          hintStyle: hintTextStyle != null
              ? hintTextStyle
              : TextStyle(
                  fontFamily: fontFamily != null ? fontFamily : "Arial",
                  fontSize: size.sp,
                  fontWeight: fontWeight != null ? fontWeight : FontWeight.w400,
                  color: textColor != null ? textColor : AppColors.GREY),
          suffixIcon: suffixIcon
        ),
        onChanged: onChanged,
        onSaved: onSaved,
      ),
    );
  }
}
