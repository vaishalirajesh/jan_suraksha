import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_logic.dart';

import '../../../../config/style_config.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/constant/string_constant.dart';
import '../../../widget/app_common_screen.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final logic = Get.find<DashboardLogic>();

  @override
  Widget build(BuildContext context) {
    return AddHeaderFooter(
        appbarName: AppString.appBarWithNotification,
        title: "John Doe",
        buttonTitle: "",
        onButtonClick: () {},
        isDataLoading: false,
        isButtonEnable: false,
        isShowButton: false,
        subTitle: "+91 99999 99999",
        child: Container(
          color: ColorConfig.jsCreamColor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      border: Border.all(
                          color: ColorConfig.jsGreyColor, width: 0.5.w)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, top: 10.h, bottom: 10.h),
                            child: Container(
                                height: 30.r,
                                width: 30.r,
                                decoration: BoxDecoration(
                                  color: ColorConfig.jsLightGreyColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 10.r,
                                    width: 10.r,
                                    child: SvgPicture.asset(
                                        Assets.profileProfilePersonalInfo),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "Personal Info",
                            style: StyleConfig.boldText16
                                .copyWith(color: ColorConfig.jsTextGreyColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      border: Border.all(
                          color: ColorConfig.jsGreyColor, width: 0.5.w)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, top: 10.h, bottom: 10.h),
                            child: Container(
                                height: 30.r,
                                width: 30.r,
                                decoration: BoxDecoration(
                                  color: ColorConfig.jsLightGreyColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 10.r,
                                    width: 10.r,
                                    child:
                                        SvgPicture.asset(Assets.profileShare),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "Share App",
                            style: StyleConfig.boldText16
                                .copyWith(color: ColorConfig.jsTextGreyColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      border: Border.all(
                          color: ColorConfig.jsGreyColor, width: 0.5.w)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, top: 10.h, bottom: 10.h),
                            child: Container(
                                height: 30.r,
                                width: 30.r,
                                decoration: BoxDecoration(
                                  color: ColorConfig.jsLightGreyColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 10.r,
                                    width: 10.r,
                                    child: SvgPicture.asset(
                                        Assets.profileProfilePrivacyPolicy),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "Privacy Policy",
                            style: StyleConfig.boldText16
                                .copyWith(color: ColorConfig.jsTextGreyColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      border: Border.all(
                          color: ColorConfig.jsGreyColor, width: 0.5.w)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, top: 10.h, bottom: 10.h),
                            child: Container(
                                height: 30.r,
                                width: 30.r,
                                decoration: BoxDecoration(
                                  color: ColorConfig.jsLightGreyColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 10.r,
                                    width: 10.r,
                                    child: SvgPicture.asset(Assets
                                        .profileProfileTermsAndConditions),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            "Terms & Conditions",
                            style: StyleConfig.boldText16
                                .copyWith(color: ColorConfig.jsTextGreyColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
