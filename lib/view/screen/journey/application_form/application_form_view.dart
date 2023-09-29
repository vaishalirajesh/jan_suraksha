import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';
import 'package:jan_suraksha/view/widget/disable_test_field.dart';

import '../../../../config/style_config.dart';
import '../../../widget/app_textfield.dart';
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
                          child: Column(children: [
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
                            initialvale: AppUtils.convertDateFormat(applicationFormLogic.getAppData.data?.dob, 'yyyy-mm-dd', 'dd/mm/yyyy'),
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
                          SizedBox(
                            height: 15.h,
                          ),
                          Offstage(
                            offstage: applicationFormLogic.schemeId.value == 2,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Whether Suffering from any Disability ? *",
                                            style: StyleConfig.mediumText16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 0.87.sw,
                                  height: 60,
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 0.80),
                                  ),
                                  child: SizedBox(
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: _dropdownValues
                                            .map((value) => DropdownMenuItem(
                                                  child: Container(width: 0.75.sw, child: Text(value)),
                                                  value: value,
                                                ))
                                            .toList(),
                                        onChanged: (i) {
                                          applicationFormLogic.disbletext.value = i!;
                                          print(i!);
                                        },
                                        isExpanded: false,
                                        value: applicationFormLogic.disbletext.value,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Offstage(
                                  offstage: applicationFormLogic.disbletext.value == "No",
                                  child: AppTextField(
                                    isMandatory: true,
                                    title: "If Yes, details thereof ",
                                    controller: TextEditingController(),
                                    hintText: "Enter Details",
                                    inputType: TextInputType.emailAddress,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ])),
                ),
              ),
            ),
            if (applicationFormLogic.isLoading.value) const AppLoader()
          ],
        );
      }),
    );
  }

  final List<String> _dropdownValues = ["Yes", "No"];
}
