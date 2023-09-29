import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/showcustomesnackbar.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_logic.dart';
import 'package:jan_suraksha/view/screen/journey/scheme_selection/select_scheme_logic.dart';

import '../../../../config/Navigation_config.dart';
import '../../../../config/style_config.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/theme_helper.dart';
import '../../../widget/app_button.dart';

class SelectSchemePage extends StatelessWidget {
  SelectSchemePage({Key? key}) : super(key: key);
  final dashboardLogic = Get.find<DashboardLogic>();
  final logic = Get.find<SelectSchemeLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: AppUtils.onWillPopToDashboard,
        child: Stack(children: <Widget>[
          Obx(() {
            return Container(
              color: ColorConfig.jsCreamColor,
              padding: EdgeInsets.only(bottom: 20.h),
              child: Image.asset(logic.isSelected.value == 2 ? Assets.schemePmsby : Assets.schemePmjjbyScheme),
            );
          }),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: Container(
                width: 1.sw,
                height: 50,
                decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.white, HexColor("#00FFFFFF")])),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back_sharp)),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Scheme Selection",
                              style: StyleConfig.boldText16.copyWith(fontSize: 16.sp, color: ColorConfig.jsBlackColor),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 0.4.sh,
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              decoration: BoxDecoration(
                color: ColorConfig.jsWhiteColor,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Jansuraksha schemes",
                    style: StyleConfig.boldText16.copyWith(fontSize: 18.sp, color: ColorConfig.jsTextGreyColor),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Please note that PMJJBY & PMSBY",
                    style: StyleConfig.smallText.copyWith(fontSize: 14.sp, color: ColorConfig.jstextLightGreyColor),
                  ),
                  Text(
                    "can be availed only once",
                    style: StyleConfig.smallText.copyWith(fontSize: 14.sp, color: ColorConfig.jstextLightGreyColor),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Column(children: [
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: logic.isSelected.value == 1 ? HexColor("#FFF6E2") : Colors.white,
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  logic.isSelected.value = 1;
                                  TGSharedPreferences.getInstance().set(PREF_SCHEME_ID, logic.isSelected.value);
                                },
                                child: Container(
                                    height: 70.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: logic.isSelected.value == 2 ? ThemeHelper.getInstance()!.colorScheme.primary : ThemeHelper.getInstance()!.colorScheme.secondaryContainer),
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  SvgPicture.asset(Assets.dashboardSchemeLogo),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    "Pradhan Mantri Jeevan\nJyoti Bima Yojana (PMJJBY)",
                                                    style: StyleConfig.mediumText16.copyWith(color: ColorConfig.jsTextGreyColor),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    Obx(() {
                      return InkWell(
                        onTap: () {
                          logic.isSelected.value = 1;
                          TGSharedPreferences.getInstance().set(PREF_SCHEME_ID, logic.isSelected.value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: logic.isSelected.value == 2 ? HexColor("#FFF6E2") : Colors.white,
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    logic.isSelected.value = 2;
                                    TGSharedPreferences.getInstance().set(PREF_SCHEME_ID, logic.isSelected.value);
                                  },
                                  child: Container(
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: logic.isSelected.value == 2 ? ThemeHelper.getInstance()!.colorScheme.primary : ThemeHelper.getInstance()!.colorScheme.secondaryContainer),
                                        borderRadius: BorderRadius.circular(16.r),
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Stack(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Center(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          SvgPicture.asset(Assets.dashboardSchemeLogo),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            "Pradhan Mantri Suraksha \nBima Yojana (PMSBY)",
                                                            style: StyleConfig.mediumText16.copyWith(color: ColorConfig.jsTextGreyColor),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ]),
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: AppButton(
            onPress: () {
              if (logic.isSelected.value == 0) {
                showSnackBar(Get.context!, "Please select scheme");
              } else {
                Get.toNamed(BankSelectionPageRoute);
              }
            },
            title: "Continue",
            isButtonEnable: true.obs,
            isDataLoading: false.obs,
          ),
        ),
      ),
    );
  }
}
