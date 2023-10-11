import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';

import '../../../../config/color_config.dart';
import '../../../../utils/constant/string_constant.dart';
import '../../../widget/app_common_screen.dart';
import '../../../widget/app_textfield.dart';
import 'customer_verification_logic.dart';

class CustomerVerificationPage extends StatelessWidget {
  CustomerVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CustomerVerificationLogic>();
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
            onButtonClick: logic.onPressContinue,
            isDataLoading: logic.isLoading.value,
            isButtonEnable: logic.isButtonEnabled.value,
            isShowButton: true,
            child: SingleChildScrollView(
              child: AbsorbPointer(
                absorbing: logic.isLoading.value,
                child: Column(
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 22.h,
                          ),
                          SizedBox(
                            child: AppTextField(
                              hintText: 'Enter Your Account Number',
                              title: 'Account Number',
                              controller: logic.accountTextController,
                              isReadOnly: false,
                              isMandatory: true,
                              isAutoFocus: false,
                              inputType: TextInputType.number,
                              errorText: logic.accountErrorMsg.value,
                              onChanged: logic.onChangeAccountNo,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          AppTextField(
                            hintText: 'Re-Enter Your Account Number',
                            title: 'Re-Enter Account Number',
                            controller: logic.reAccountTextController,
                            isReadOnly: false,
                            isMandatory: true,
                            errorText: logic.reAccountErrorMsg.value,
                            inputType: TextInputType.number,
                            onChanged: logic.onChangeAccountNo,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          AppTextField(
                            hintText: 'Enter Date Of Birth',
                            title: 'Date Of Birth',
                            controller: logic.dobTextController,
                            isReadOnly: true,
                            isMandatory: true,
                            onTap: logic.selectDate,
                            isDobField: true,
                            errorText: logic.dobErrorMsg.value,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
