import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/theme_helper.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {Key? key,
      required this.hintText,
      this.isShowSuffixIcon = false,
      this.isObscureText = false,
      required this.isShowPassword,
      this.maxLength = 40,
      this.inputType = TextInputType.text,
      required this.controller,
      this.onChanged,
      this.isReadOnly = false,
      this.isDobField = false,
      this.title = '',
      this.isAutoFocus = false,
      this.prefixText = '',
      required this.isMandatory,
      this.errorText = '',
      this.suffix,
      this.onTap,
      this.onTapEye,
      this.textInputFormatter,
      this.shouldInputNamesOnly})
      : super(key: key);
  final String hintText;
  final bool? shouldInputNamesOnly;
  final String title;
  final bool isShowSuffixIcon;
  final bool isObscureText;
  final RxBool isShowPassword;
  final int maxLength;
  final TextInputType? inputType;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onTapEye;
  final bool isReadOnly;
  final bool isMandatory;
  final bool isAutoFocus;
  final String prefixText;
  final String? errorText;
  final bool isDobField;
  final Widget? suffix;
  final List<TextInputFormatter>? textInputFormatter;

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
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: hintText,
            suffix: suffix,
            counterText: AppString.emptyText,
            hintStyle: StyleConfig.smallTextLight,
            prefixIconConstraints: BoxConstraints(minWidth: 24.w, maxHeight: 24.h),
            errorText: errorText!.isEmpty ? null : errorText,
            filled: true,
            prefix: prefixText != ''
                ? Text(
                    prefixText,
                    style: StyleConfig.smallText,
                  )
                : const SizedBox.shrink(),
            fillColor: isReadOnly && !isDobField
                ? ThemeHelper.getInstance()!.colorScheme.surface
                : ThemeHelper.getInstance()!.colorScheme.background,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              borderSide: BorderSide(
                width: 1,
                color: isReadOnly && !isDobField
                    ? ThemeHelper.getInstance()!.colorScheme.surface
                    : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isReadOnly && !isDobField
                      ? ThemeHelper.getInstance()!.colorScheme.surface
                      : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                  width: 1.0),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConfig.jsRedColor, width: 1.0),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isReadOnly && !isDobField
                      ? ThemeHelper.getInstance()!.colorScheme.surface
                      : ThemeHelper.getInstance()!.colorScheme.secondaryContainer,
                  width: 1.0),
              borderRadius: BorderRadius.circular(16.0.r),
            ),
            contentPadding: EdgeInsets.zero,
            suffixIconConstraints: BoxConstraints(
              minWidth: 25,
              minHeight: 25,
            ),
          ),
          onChanged: onChanged,
          inputFormatters: textInputFormatter,
          autofocus: isAutoFocus,
          onTap: onTap,
        ),
      ],
    );
  }
}
