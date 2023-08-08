import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/theme_helper.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.hintText,
    this.isShowSuffixIcon = false,
    this.isObscureText = false,
    this.isShowPassword = false,
    this.maxLength = 40,
    this.inputType = TextInputType.text,
    required this.controller,
    this.onChanged,
    required this.isReadOnly,
    this.title = '',
    required this.isMandatory,
  }) : super(key: key);
  final String hintText;
  final String title;
  final bool isShowSuffixIcon;
  final bool isObscureText;
  final bool isShowPassword;
  final int maxLength;
  final TextInputType? inputType;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool isReadOnly;
  final bool isMandatory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: StyleConfig.mediumText16,
                ),
                if (isMandatory)
                  TextSpan(
                    text: AppString.mandatorySign,
                    style: StyleConfig.mediumText16.copyWith(color: ColorConfig.jsPrimaryColor),
                  ),
              ],
            ),
          ),
        if (title.isNotEmpty)
          SizedBox(
            height: 15.h,
          ),
        TextField(
          controller: controller,
          obscureText: isObscureText,
          maxLength: maxLength,
          keyboardType: inputType,
          style: StyleConfig.smallText,
          readOnly: isReadOnly,
          cursorColor: ColorConfig.jsLightBlackColor,
          decoration: InputDecoration(
            hintText: hintText,
            counterText: AppString.emptyText,
            hintStyle: StyleConfig.smallTextLight,
            prefixIconConstraints: BoxConstraints(minWidth: 24.w, maxHeight: 24.h),
            filled: true,
            fillColor: isReadOnly
                ? ThemeHelper.getInstance()!.colorScheme.surface
                : ThemeHelper.getInstance()!.colorScheme.background,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              borderSide: BorderSide(
                width: 1,
                color: isReadOnly
                    ? ThemeHelper.getInstance()!.colorScheme.surface
                    : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isReadOnly
                      ? ThemeHelper.getInstance()!.colorScheme.surface
                      : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                  width: 1.0),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
