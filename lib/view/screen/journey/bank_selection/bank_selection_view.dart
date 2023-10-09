import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/navigation_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';

import '../../../../generated/assets.dart';
import '../../../../utils/theme_helper.dart';
import '../../homepage/dashboard/dashboard_view.dart';
import 'bank_selection_logic.dart';

class BankSelectionPage extends StatelessWidget {
  BankSelectionPage({Key? key}) : super(key: key);
  final bankSelectionLogic = Get.find<BankSelectionLogic>();
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
    "Punjab National Bank",
    "Bank of Baroda",
    "HDFC bank"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: Obx(() {
        return Stack(
          children: [
            AddHeaderFooter(
                appbarName: AppString.appBarWithTitle,
                title: "Select Bank",
                buttonTitle: "",
                onButtonClick: () {},
                isDataLoading: false,
                isButtonEnable: false,
                onBackButtonCLick: AppUtils.onBackToDashboard,
                isShowButton: false,
                child: ConstrainedFlexView(MediaQuery.of(context).size.height * 1,
                    axis: Axis.vertical,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h, left: 10.h, right: 10.h),
                            child: TextField(
                              autofocus: false,
                              style: StyleConfig.regularText16,
                              onChanged: (_) {},
                              cursorColor: ColorConfig.jsPrimaryColor,
                              scrollPadding: EdgeInsets.zero,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                prefixIcon: Icon(Icons.search_rounded, color: ThemeHelper.getInstance()!.primaryColor),
                                labelText: "Search your bank",
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                hintStyle: StyleConfig.regularText16.copyWith(color: ColorConfig.jsSearchTextGreyColor),
                                border: InputBorder.none,
                                labelStyle: StyleConfig.regularText16.copyWith(
                                  color: ColorConfig.jsSearchTextGreyColor,
                                ),
                              ),
                            ),
                          ),
                          Divider(),
                          // Container(
                          //   height: 200.h,
                          //   child: GridView.count(
                          //     crossAxisCount: 3,
                          //     childAspectRatio: 1.0,
                          //     children: List.generate(
                          //       6,
                          //       (index) => InkWell(
                          //         onTap: () {
                          //           Get.toNamed(CustomerVerificationPageRoute);
                          //         },
                          //         child: SizedBox(
                          //           height: 150.h,
                          //           child: Column(
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             children: [
                          //               SizedBox(height: 30.r, width: 30.r, child: Image.asset(list[index])),
                          //               Center(
                          //                 child: Container(
                          //                   alignment: Alignment.center,
                          //                   margin: const EdgeInsets.all(10),
                          //                   child: Text(
                          //                     listname[index],
                          //                     textAlign: TextAlign.center,
                          //                     style:
                          //                         StyleConfig.boldText16.copyWith(color: Colors.black, fontSize: 10.sp),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Text(
                              "All Banks",
                              style: StyleConfig.boldText16.copyWith(color: Colors.black, fontSize: 16.sp),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 80.h),
                              child: SizedBox(
                                child: ListView.separated(
                                  itemCount: bankSelectionLogic.bankList.length,
                                  separatorBuilder: (BuildContext context, int index) => Divider(height: 1),
                                  itemBuilder: (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        Get.toNamed(CustomerVerificationPageRoute);
                                        TGSharedPreferences.getInstance()
                                            .set(PREF_ORG_ID, bankSelectionLogic.bankList[index].id ?? 0);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: ListTile(
                                          title: Text(
                                            bankSelectionLogic.bankList.isNotEmpty &&
                                                    bankSelectionLogic.bankList[index].value != null
                                                ? bankSelectionLogic.bankList[index].value ?? ''
                                                : '',
                                            style: StyleConfig.mediumText16.copyWith(fontSize: 13.sp),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ]))),
            if (bankSelectionLogic.isLoading.value) AppLoader()
          ],
        );
      }),
    );
  }
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
