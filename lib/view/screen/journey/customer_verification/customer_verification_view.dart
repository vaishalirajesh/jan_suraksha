import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/navigation_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/view/widget/otp_bottom_sheet.dart';

import '../../../../config/color_config.dart';
import '../../../../generated/assets.dart';
import '../../../../utils/constant/string_constant.dart';
import '../../../widget/app_common_screen.dart';
import '../../../widget/app_textfield.dart';
import '../../homepage/dashboard/dashboard_view.dart';
import 'customer_verification_logic.dart';

class CustomerVerificationPage extends StatelessWidget {
  CustomerVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Customer_verificationLogic>();
    return Obx(() {
      return AddHeaderFooter(
          appbarName: AppString.appBarWithTitle,
          title: "Customer Verification",
          buttonTitle: "Continue",
          onButtonClick: () {
            OTPBottomSheet.getBottomSheet(
              onChangeOTP: (s) {},
              onSubmitOTP: (s) {},
              mobileNumber: '1234567890',
              isEnable: true.obs,
              isLoading: false.obs,
              onButtonPress: () {
                Get.toNamed(AccountSelectionPageRoute);
              },
            );
          },
          isDataLoading: false,
          isButtonEnable: logic.isbuttonenabled.value,
          isShowButton: true,
          child: ConstrainedFlexView(
            MediaQuery.of(context).size.height * 0.75,
            axis: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: ColorConfig.jsCreamColor,
                  height: MediaQuery.of(context).size.height / 3.1,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100.h, vertical: 30.h),
                    child: SvgPicture.asset(Assets.schemeSchemeselection),
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Account Number",
                        style: StyleConfig.semiBoldExtraSmallText
                            .copyWith(fontSize: 14.sp),
                      ),
                      Text(
                        " *",
                        style: StyleConfig.semiBoldExtraSmallText.copyWith(
                            fontSize: 14.sp, color: ColorConfig.jsPrimaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: SizedBox(
                    child: AppTextField(
                      hintText: 'Enter Your Account Number',
                      controller: logic.accountTextController,
                      isReadOnly: false,
                      isMandatory: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Re-Enter Account Number",
                        style: StyleConfig.semiBoldExtraSmallText
                            .copyWith(fontSize: 14.sp),
                      ),
                      Text(
                        " *",
                        style: StyleConfig.semiBoldExtraSmallText.copyWith(
                            fontSize: 14.sp, color: ColorConfig.jsPrimaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: AppTextField(
                    hintText: 'Re-Enter Your Account Number',
                    controller: logic.reAccountTextController,
                    isReadOnly: false,
                    isMandatory: true,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Date Of Birth",
                        style: StyleConfig.semiBoldExtraSmallText
                            .copyWith(fontSize: 14.sp),
                      ),
                      Text(
                        " *",
                        style: StyleConfig.semiBoldExtraSmallText.copyWith(
                            fontSize: 14.sp, color: ColorConfig.jsPrimaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: AppTextField(
                    hintText: 'Enter Date Of Birth',
                    controller: logic.dobTextController,
                    isReadOnly: false,
                    isMandatory: true,
                  ),
                )
              ],
            ),
          ));
    });
  }
}
