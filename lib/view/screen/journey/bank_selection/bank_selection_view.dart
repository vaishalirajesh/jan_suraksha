import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/theme_helper.dart';
import '../../homepage/dashboard/dashboard_view.dart';
import 'bank_selection_logic.dart';

class BankSelectionPage extends StatelessWidget {
  BankSelectionPage({Key? key}) : super(key: key);
  final logic = Get.find<Bank_selectionLogic>();
  final list = [
    Assets.bankselectionSbi,
    Assets.bankselectionBoi,
    Assets.bankselectionCanara,
    Assets.bankselectionPnb,
    Assets.bankselectionBob,
    Assets.bankselectionHdfc
  ];
  final listname = [
    "State bank of India",
    "Bank of Baroda",
    "Canara bank",
    "Pnb bank",
    "Bank of Baroda",
    "HDFC bank"
  ];
  @override
  Widget build(BuildContext context) {
    return AddHeaderFooter(
        appbarName: AppString.appBarWithTitle,
        title: "Select Bank",
        buttonTitle: "",
        onButtonClick: () {},
        isDataLoading: false,
        isButtonEnable: false,
        isShowButton: false,
        child: ConstrainedFlexView(MediaQuery.of(context).size.height * 0.79,
            axis: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 10.h, left: 10.h, right: 10.h),
                    child: SizedBox(
                      height: 40.h,
                      width: 240.w,
                      child: TextField(
                        autofocus: false,
                        style: StyleConfig.regularText16,
                        onChanged: (_) {},
                        cursorColor: ColorConfig.jsPrimaryColor,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                          prefixIcon: Icon(Icons.search_rounded,
                              color: ThemeHelper.getInstance()!.primaryColor),
                          labelText: "Search",
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintStyle: TextStyle(
                              color: ThemeHelper.getInstance()!.primaryColor),
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              color: ThemeHelper.getInstance()!.primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 200.h,
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      children: List.generate(
                        6,
                        (index) => InkWell(
                          onTap: () {},
                          child: SizedBox(
                            height: 150.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(list[index]),
                                Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.all(10),
                                    child: Text(
                                      listname[index],
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ])));
  }
}
