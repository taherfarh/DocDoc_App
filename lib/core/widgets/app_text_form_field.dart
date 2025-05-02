import 'package:advanced_project/core/theming/colors.dart';
import 'package:advanced_project/core/theming/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentBadding;
  final InputBorder? focusborder;
  final InputBorder? enabledborder;
  final TextStyle? inputtextstyle;
  final TextStyle? hinttextStyle;
  final String hinttetxt;
  final bool? isobscuretext;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String?) validatour;

  const AppTextFormField({
    super.key,
    this.contentBadding,
    this.focusborder,
    this.enabledborder,
    this.inputtextstyle,
    this.hinttextStyle,
    required this.hinttetxt,
    this.isobscuretext,
    this.suffixIcon,
    this.controller,
    required this.validatour,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentBadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder:
            focusborder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: ColorsManager.mainblue, width: 1.3),
              borderRadius: BorderRadius.circular(16),
            ),
        enabledBorder:
            enabledborder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorsManager.LighterGrey,
                width: 1.3,
              ),

              borderRadius: BorderRadius.circular(16),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
          borderRadius: BorderRadius.circular(16.0),
        ),

        hintStyle: hinttextStyle ?? Textstyles.font14LightGreyRegular,
        hintText: hinttetxt,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: ColorsManager.morelightgrey,
      ),
      obscureText: isobscuretext ?? false,
      style: Textstyles.font14DarkBlueMedium,
      validator: (value) {
        return validatour(value);
      },
    );
  }
}
