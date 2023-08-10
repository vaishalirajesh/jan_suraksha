import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/theme_helper.dart';
import 'package:jan_suraksha/view/widget/appbar_with_title.dart';

import 'app_button.dart';

class AddHeaderFooter extends StatelessWidget {
  AddHeaderFooter({
    Key? key,
    required this.child,
    required this.appbarName,
    required this.title,
    required this.buttonTitle,
    required this.onButtonClick,
    required this.isDataLoading,
    required this.isButtonEnable,
    this.isShowButton = true,
    this.subTitle = '',
  }) : super(key: key);
  Widget child;
  String appbarName = '';
  String title = '';
  String subTitle = '';
  String buttonTitle = '';
  VoidCallback onButtonClick;
  bool isButtonEnable = false;
  bool isDataLoading = false;
  bool isShowButton = true;

  PreferredSizeWidget getAppBar() {
    switch (appbarName) {
      case AppString.appBarWithTitle:
        return CommonAppBar.appbarWithTitle(title: title);
      case AppString.appBarWithSubtitle:
        return CommonAppBar.appbarWithSubTitle(
            title: title, subTitle: subTitle);
      case AppString.appBarWithNotification:
        return CommonAppBar.appbarWithNotification(
            title: title, subTitle: subTitle);
      default:
        return CommonAppBar.appbarWithTitle(title: title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeHelper.getInstance()?.colorScheme.background,
        appBar: getAppBar(),
        body: child,
        bottomNavigationBar: isShowButton
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: AppButton(
                  onPress: onButtonClick,
                  title: buttonTitle,
                  isButtonEnable: isButtonEnable.obs,
                  isDataLoading: isDataLoading.obs,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
