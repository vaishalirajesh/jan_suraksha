import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';
import 'package:jan_suraksha/view/widget/disable_test_field.dart';

import 'application_form_logic.dart';

class ApplicationFormPage extends StatelessWidget {
  ApplicationFormPage({Key? key}) : super(key: key);

  final applicationFormLogic = Get.find<ApplicationFormLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopToDashboard,
      child: Obx(() {
        return Stack(
          children: [
            AddHeaderFooter(
              appbarName: AppString.appBarWithTitleAndProgressBar,
              title: AppString.applicationForm,
              buttonTitle: AppString.continueText,
              onButtonClick: applicationFormLogic.onPressContinue,
              isDataLoading: false,
              isButtonEnable: true,
              isShowButton: true,
              onBackButtonCLick: AppUtils.onBackToDashboard,
              progress: 0.4,
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Obx(
                  () => applicationFormLogic.isLoading.value
                      ? const SizedBox.shrink()
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              DisableTextField(
                                isMandatory: true,
                                initialvale: applicationFormLogic.getAppData.data?.firstName ?? '',
                                title: AppString.firstName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: applicationFormLogic.getAppData.data?.middleName ?? '',
                                title: AppString.middleName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: applicationFormLogic.getAppData.data?.lastName ?? '',
                                title: AppString.lastName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: applicationFormLogic.getAppData.data?.fatherHusbandName ?? '',
                                title: AppString.fatherName,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: AppUtils.convertDateFormat(
                                    applicationFormLogic.getAppData.data?.dob, 'yyyy-mm-dd', 'dd/mm/yyyy'),
                                title: AppString.dateOfBirth,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: applicationFormLogic.getAppData.data?.mobileNo ?? '',
                                title: AppString.mobileNumber,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: applicationFormLogic.getAppData.data?.emailAddress ?? '',
                                title: AppString.emailId,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: applicationFormLogic.getAppData.data?.insuranceName ?? '',
                                title: AppString.insurerName,
                                isReadOnly: true,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            if (applicationFormLogic.isLoading.value) const AppLoader()
          ],
        );
      }),
    );
  }
}
