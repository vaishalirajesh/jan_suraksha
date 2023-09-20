import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';
import 'package:jan_suraksha/view/widget/app_textfield.dart';

import 'guradian_details_logic.dart';

class GuradianDetailsPage extends StatelessWidget {
  GuradianDetailsPage({Key? key}) : super(key: key);

  final guradianDetailsLogic = Get.find<GuradianDetailsLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: Obx(() {
        return Stack(
          children: [
            AddHeaderFooter(
              appbarName: AppString.appBarWithTitle,
              title: AppString.gaurdianDetails,
              buttonTitle: AppString.continueText,
              onButtonClick: guradianDetailsLogic.onPressContinue,
              isDataLoading: false,
              onBackButtonCLick: AppUtils.onBackPress,
              isButtonEnable: true,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.h),
                  child: Obx(
                    () => !guradianDetailsLogic.isLoading.value
                        ? const SizedBox.shrink()
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                AppTextField(
                                  isMandatory: true,
                                  title: AppString.name,
                                  controller: guradianDetailsLogic.firstNameController,
                                  hintText: AppString.enterYourName,
                                  inputType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                AppTextField(
                                  isMandatory: true,
                                  title: AppString.address,
                                  controller: guradianDetailsLogic.addressController,
                                  hintText: AppString.enterYourAddress,
                                  inputType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                AppTextField(
                                  isMandatory: true,
                                  title: AppString.relationNominee,
                                  controller: guradianDetailsLogic.relationWithApplicantController,
                                  hintText: AppString.selectRelation,
                                  inputType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                AppTextField(
                                  isMandatory: false,
                                  title: AppString.mobileNumber,
                                  controller: guradianDetailsLogic.mobileController,
                                  hintText: AppString.enterMobile,
                                  inputType: TextInputType.phone,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                AppTextField(
                                  isMandatory: false,
                                  title: AppString.emailId,
                                  controller: guradianDetailsLogic.emailController,
                                  hintText: AppString.enterEmail,
                                  inputType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
            ),
            if (!guradianDetailsLogic.isLoading.value) const AppLoader()
          ],
        );
      }),
    );
  }
}
