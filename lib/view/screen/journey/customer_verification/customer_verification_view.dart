import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/navigation_config.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/otp_bottom_sheet.dart';

import '../../../../config/color_config.dart';
import '../../../../utils/constant/string_constant.dart';
import '../../../widget/app_common_screen.dart';
import '../../../widget/app_textfield.dart';
import 'customer_verification_logic.dart';

class CustomerVerificationPage extends StatelessWidget {
  CustomerVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<Customer_verificationLogic>();
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Obx(() {
          return AddHeaderFooter(
              appbarName: AppString.appBarWithTitle,
              title: "Customer Verification",
              buttonTitle: "Continue",
              onBackButtonCLick: AppUtils.onBackPress,
              onButtonClick: () {
                OTPBottomSheet.getBottomSheet(
                  context: context,
                  onChangeOTP: (s) {
                    print("Mediaquery " + MediaQuery.of(context).viewInsets.bottom.toString());
                  },
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
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 1.sh,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: ColorConfig.jsCreamColor,
                        padding: EdgeInsets.only(top: 40.h, bottom: 50.h),
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 100.h,
                            width: 0.4.sw,
                            child: Image.asset(
                              AppImages.verification,
                            ),
                          ),
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
                              style: StyleConfig.semiBoldExtraSmallText.copyWith(fontSize: 14.sp),
                            ),
                            Text(
                              " *",
                              style: StyleConfig.semiBoldExtraSmallText
                                  .copyWith(fontSize: 14.sp, color: ColorConfig.jsPrimaryColor),
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
                              style: StyleConfig.semiBoldExtraSmallText.copyWith(fontSize: 14.sp),
                            ),
                            Text(
                              " *",
                              style: StyleConfig.semiBoldExtraSmallText
                                  .copyWith(fontSize: 14.sp, color: ColorConfig.jsPrimaryColor),
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
                              style: StyleConfig.semiBoldExtraSmallText.copyWith(fontSize: 14.sp),
                            ),
                            Text(
                              " *",
                              style: StyleConfig.semiBoldExtraSmallText
                                  .copyWith(fontSize: 14.sp, color: ColorConfig.jsPrimaryColor),
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
                ),
              ));
        }),
      ),
    );
  }
}
