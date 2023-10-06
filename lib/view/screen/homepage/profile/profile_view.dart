import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/config/navigation_config.dart';
import 'package:jan_suraksha/model/request_model/LogoutRequest.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_binding.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_view.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_logic.dart';
import 'package:jan_suraksha/view/screen/homepage/profile/genral_faq_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/profile/pmjjby_faq_view.dart';
import 'package:jan_suraksha/view/screen/homepage/profile/pmsby_faq_view.dart';
import 'package:jan_suraksha/view/screen/homepage/profile/profile_binding.dart';

import '../../../../config/style_config.dart';
import '../../../../generated/assets.dart';
import '../../../../services/services.dart';
import '../../../../utils/constant/string_constant.dart';
import '../../../widget/app_common_screen.dart';
import '../../../widget/pdfviewfile.dart';
import 'genral_faq_view.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final logic = Get.find<DashboardLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: AddHeaderFooter(
          appbarName: AppString.appBarWithNotification,
          title: logic.userName.value,
          buttonTitle: "",
          onButtonClick: () {},
          onBackButtonCLick: AppUtils.onBackToDashboard,
          isDataLoading: false,
          isButtonEnable: false,
          isShowButton: false,
          subTitle: logic.mobilenumber.value,
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
                        border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(PersonalInfoPageRoute);
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                                child: Container(
                                    height: 32.r,
                                    width: 32.r,
                                    decoration: BoxDecoration(
                                      color: ColorConfig.jsLightGreyColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        height: 12.r,
                                        width: 12.r,
                                        child: SvgPicture.asset(Assets.profileProfilePersonalInfo),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "Personal Info",
                                style: StyleConfig.semiBolText15.copyWith(color: ColorConfig.jsTextGreyColor),
                              )
                            ],
                          ),
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
                        border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // OTPBottomSheetEmail.getBottomSheet(
                            //   context: Get.context!,
                            //   onChangeOTP: (s) {},
                            //   onSubmitOTP: (s) {},
                            //   title: 'Update Email ID',
                            //   isEnable: true.obs,
                            //   isLoading: false.obs,
                            //   onButtonPress: () {},
                            //   notNow: () {},
                            // );
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                                child: Container(
                                    height: 32.r,
                                    width: 32.r,
                                    decoration: BoxDecoration(
                                      color: ColorConfig.jsLightGreyColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        height: 10.r,
                                        width: 10.r,
                                        child: SvgPicture.asset(Assets.profileShare),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "Share App",
                                style: StyleConfig.semiBolText15.copyWith(color: ColorConfig.jsTextGreyColor),
                              )
                            ],
                          ),
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
                        border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyStatefulWidget("1")));
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                                child: Container(
                                    height: 32.r,
                                    width: 32.r,
                                    decoration: BoxDecoration(
                                      color: ColorConfig.jsLightGreyColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        height: 10.r,
                                        width: 10.r,
                                        child: SvgPicture.asset(Assets.profileProfilePrivacyPolicy),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "Privacy Policy",
                                style: StyleConfig.semiBolText15.copyWith(color: ColorConfig.jsTextGreyColor),
                              )
                            ],
                          ),
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
                        border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w)),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyStatefulWidget("2")));
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                                child: Container(
                                    height: 32.r,
                                    width: 32.r,
                                    decoration: BoxDecoration(
                                      color: ColorConfig.jsLightGreyColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        height: 10.r,
                                        width: 10.r,
                                        child: SvgPicture.asset(Assets.profileProfileTermsAndConditions),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "Terms & Conditions",
                                style: StyleConfig.semiBolText15.copyWith(color: ColorConfig.jsTextGreyColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => GeneralFaqPage(), binding: GenralFaqBinding());
                  },
                  child: Padding(
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
                          border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                                child: Container(
                                    height: 32.r,
                                    width: 32.r,
                                    decoration: BoxDecoration(
                                      color: ColorConfig.jsLightGreyColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: SizedBox(
                                        height: 10.r,
                                        width: 10.r,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: ColorConfig.jsSecondaryColor, width: 0.5.w),
                                          ),
                                          // padding: EdgeInsets.all(1.r),
                                          child: Icon(Icons.question_mark,
                                              color: ColorConfig.jsSecondaryColor, size: 11.r),
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "General FAQs",
                                style: StyleConfig.semiBolText15.copyWith(color: ColorConfig.jsTextGreyColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => PMJJBYFaqPage(), binding: GenralFaqBinding());
                  },
                  child: Padding(
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
                          border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                                child: Container(
                                  height: 32.r,
                                  width: 32.r,
                                  decoration: BoxDecoration(
                                    color: ColorConfig.jsLightGreyColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: 10.r,
                                      width: 10.r,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: ColorConfig.jsSecondaryColor, width: 0.5.w),
                                        ),
                                        // padding: EdgeInsets.all(1.r),
                                        child:
                                            Icon(Icons.question_mark, color: ColorConfig.jsSecondaryColor, size: 11.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "PMJJBY FAQs",
                                style: StyleConfig.semiBolText15.copyWith(color: ColorConfig.jsTextGreyColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => PMSBYFaqPage(), binding: GenralFaqBinding());
                  },
                  child: Padding(
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
                          border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                                child: Container(
                                  height: 32.r,
                                  width: 32.r,
                                  decoration: BoxDecoration(
                                    color: ColorConfig.jsLightGreyColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: 10.r,
                                      width: 10.r,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: ColorConfig.jsSecondaryColor, width: 0.5.w),
                                        ),
                                        // padding: EdgeInsets.all(1.r),
                                        child:
                                            Icon(Icons.question_mark, color: ColorConfig.jsSecondaryColor, size: 11.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "PMSBY FAQs",
                                style: StyleConfig.semiBolText15.copyWith(color: ColorConfig.jsTextGreyColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await TGSharedPreferences.getInstance().set(PREF_IS_FROM_REG, false);

                    LogOutRequest request = LogOutRequest(id: "", type: "");

                    ServiceManager.getInstance().logOut(
                        request: request,
                        onSuccess: (respose) => _onsuccsessSetPassword(respose),
                        onError: (response) => _onErrorSetPassword(response));
                  },
                  child: Padding(
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
                          border: Border.all(color: ColorConfig.jsGreyColor, width: 0.5.w)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
                                child: Container(
                                  height: 32.r,
                                  width: 32.r,
                                  decoration: BoxDecoration(
                                    color: ColorConfig.jsLightGreyColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: 10.r,
                                      width: 10.r,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: ColorConfig.jsSecondaryColor, width: 0.5.w),
                                        ),
                                        // padding: EdgeInsets.all(1.r),
                                        child: Icon(Icons.logout, color: ColorConfig.jsSecondaryColor, size: 11.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "Log Out",
                                style: StyleConfig.semiBolText15.copyWith(color: ColorConfig.jsTextGreyColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  _onsuccsessSetPassword(respose) {
    TGSharedPreferences.getInstance().remove(PREF_GSTIN);
    TGSharedPreferences.getInstance().remove(PREF_LOGIN_RES);
    TGSharedPreferences.getInstance().remove(PREF_REFRESHTOKEN);
    TGSharedPreferences.getInstance().remove(PREF_LOGIN_TOKEN);
    TGSharedPreferences.getInstance().remove(PREF_LOGIN_USERNAME);
    TGSharedPreferences.getInstance().remove(PREF_MOBILE);
    TGSharedPreferences.getInstance().remove(PREF_PANNO);
    TGSharedPreferences.getInstance().remove(PREF_BUSINESSNAME);
    TGSharedPreferences.getInstance().remove(PREF_USERNAME);
    TGSharedPreferences.getInstance().remove(PREF_USERSTATE);
    TGSharedPreferences.getInstance().remove(PREF_AAID);
    TGSharedPreferences.getInstance().remove(PREF_AACODE);
    TGSharedPreferences.getInstance().remove(PREF_LOANAPPREFID);
    TGSharedPreferences.getInstance().remove(PREF_LOANOFFER);
    TGSharedPreferences.getInstance().remove(PREF_AAURL);
    TGSharedPreferences.getInstance().remove(PREF_AACALLBACKURL);
    TGSharedPreferences.getInstance().remove(PREF_CONSENTTYPE);
    TGSharedPreferences.getInstance().remove(PREF_CONSENT_AAID);
    TGSharedPreferences.getInstance().remove(PREF_OFFERID);
    TGSharedPreferences.getInstance().remove(PREF_LOANAPPID);
    TGSharedPreferences.getInstance().remove(PREF_REPAYMENTPLANID);
    TGSharedPreferences.getInstance().remove(PREF_CURRENT_STAGE);
    TGSharedPreferences.getInstance().remove(PREF_ISTC_DONE);
    TGSharedPreferences.getInstance().remove(PREF_ISGST_CONSENT);
    TGSharedPreferences.getInstance().remove(PREF_ISGSTDETAILDONE);
    TGSharedPreferences.getInstance().remove(PREF_ISCIC_CONSENT);
    TGSharedPreferences.getInstance().remove(PREF_ACCESS_TOKEN);
    TGSharedPreferences.getInstance().remove(PREF_ENABLE_POPUP);
    TGSharedPreferences.getInstance().remove(PREF_APP_ID);
    TGSharedPreferences.getInstance().remove(PREF_ORG_ID);
    TGSharedPreferences.getInstance().remove(PREF_SCHEME_ID);
    TGSharedPreferences.getInstance().remove(PREF_USER_ID);
    TGSharedPreferences.getInstance().remove(PREF_ACCOUNT_HOLDER_DATA);
    TGSharedPreferences.getInstance().remove(PREF_USER_FORM_DATA);
    TGSharedPreferences.getInstance().remove(PREF_IS_FROM_REG);
    TGSharedPreferences.getInstance().remove(PREF_IS_ADULT);
    TGSharedPreferences.getInstance().remove(PREF_USER_NAME);
    TGSharedPreferences.getInstance().remove(PREF_USER_EMAIL);
    Get.offAll(() => LoginPage(), binding: LoginBinding());
  }

  _onErrorSetPassword(response) {}
}
