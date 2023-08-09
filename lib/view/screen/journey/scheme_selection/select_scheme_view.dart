import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';

import '../../homepage/dashboard/dashboard_view.dart';
import 'select_scheme_logic.dart';

class SelectSchemePage extends StatelessWidget {
  SelectSchemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SelectSchemeLogic>();
    return AddHeaderFooter(
        appbarName: AppString.appBarWithTitle,
        title: "Scheme Selection",
        buttonTitle: "Continue",
        onButtonClick: () {},
        isDataLoading: false,
        isButtonEnable: logic.isSchemeSelected.value,
        child: ConstrainedFlexView(MediaQuery.of(context).size.height * 1.02,
            axis: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    color: ColorConfig.jsCreamColor,
                    height: MediaQuery.of(context).size.height / 2.3,
                  )
                ])));
  }
}
