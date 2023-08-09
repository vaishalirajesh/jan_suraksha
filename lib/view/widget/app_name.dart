import 'package:flutter/material.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: AppString.janText,
            style: StyleConfig.boldLargeText,
          ),
          TextSpan(
            text: AppString.surakshaText,
            style: StyleConfig.boldLargeText.copyWith(color: ColorConfig.jsBlueColor),
          ),
        ],
      ),
    );
  }
}
