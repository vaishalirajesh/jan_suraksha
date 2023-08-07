import 'package:flutter/material.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/widget/app_common_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddHeaderFooter(
      title: "Testing header",
      appbarName: AppString.appBarWithNotification,
      buttonTitle: "Test Button",
      onButtonClick: () {},
      isDataLoading: false,
      isButtonEnable: true,
      subTitle: "Happy to have you onboard! Let's start by finding out which insurance you need.",
      child: Container(),
    );
  }
}
