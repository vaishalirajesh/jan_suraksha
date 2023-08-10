import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/disable_test_field.dart';

import 'application_form_logic.dart';

class ApplicationFormPage extends StatelessWidget {
  ApplicationFormPage({Key? key}) : super(key: key);

  final applicationFormLogic = Get.find<ApplicationFormLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AddHeaderFooter(
        appbarName: AppString.appBarWithTitle,
        title: AppString.applicationForm,
        buttonTitle: AppString.continueText,
        onButtonClick: applicationFormLogic.onPressContinue,
        isDataLoading: false,
        isButtonEnable: applicationFormLogic.isDataLoaded.value,
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Obx(
            () => !applicationFormLogic.isDataLoaded.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        DisableTextField(
                          isMandatory: true,
                          initialvale: applicationFormLogic.firstName,
                          title: AppString.firstName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: 'CHAXXXXXX',
                          title: AppString.middleName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: 'TAXXXXX',
                          title: AppString.lastName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'TAXXXXX',
                          title: AppString.fatherName,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: '01/01/2020',
                          title: AppString.dateOfBirth,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: '1234567890',
                          title: AppString.mobileNumber,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: false,
                          initialvale: 'abc@gmail.com',
                          title: AppString.emailId,
                          isReadOnly: true,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        const DisableTextField(
                          isMandatory: true,
                          initialvale: 'abc insurer pvt. ltd.',
                          title: AppString.insurerName,
                          isReadOnly: true,
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      );
    });
  }
}
