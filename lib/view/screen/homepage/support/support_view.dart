import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_logic.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';

class SupportPage extends StatelessWidget {
  SupportPage({Key? key}) : super(key: key);

  final logic = Get.find<DashboardLogic>();

  @override
  Widget build(BuildContext context) {
    return AddHeaderFooter(
        appbarName: AppString.appBarWithNotification,
        title: "Support",
        buttonTitle: "buttonTitle",
        onButtonClick: () {},
        isDataLoading: false,
        isButtonEnable: false,
        isShowButton: false,
        subTitle: "If you are stuck, Let us know",
        child: Container());
  }
}
