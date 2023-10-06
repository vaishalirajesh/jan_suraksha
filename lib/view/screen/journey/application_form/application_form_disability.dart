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

class ApplicationFormDisabilityPage extends StatelessWidget {
  ApplicationFormDisabilityPage({Key? key}) : super(key: key);

  final applicationFormLogic = Get.find<ApplicationFormLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: Obx(() {
        return Stack(
          children: [
            AddHeaderFooter(
              appbarName: AppString.appBarWithTitleAndProgressBar,
              title: 'Disability Declaration',
              buttonTitle: AppString.continueText,
              onButtonClick: applicationFormLogic.onPressContinueFromDisability,
              isDataLoading: false,
              isButtonEnable: true,
              isShowButton: true,
              onBackButtonCLick: AppUtils.onBackPress,
              progress: 0.4,
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Obx(
                  () => applicationFormLogic.isLoading.value
                      ? const SizedBox.shrink()
                      : Column(children: [
                          Column(
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
                                height: 20.h,
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
                                                value: value,
                                                child: SizedBox(child: Text(value)),
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
                                height: 20.h,
                              ),
                              Offstage(
                                offstage: applicationFormLogic.disbletext.value != "Yes",
                                child: AppTextField(
                                  isMandatory: true,
                                  title: "If Yes, details thereof ",
                                  controller: applicationFormLogic.disableController,
                                  hintText: "Enter Details",
                                  inputType: TextInputType.emailAddress,
                                  errorText: applicationFormLogic.disableError.value,
                                  onChanged: (str) {
                                    applicationFormLogic.disableError.value = '';
                                  },
                                ),
                              )
                            ],
                          ),
                        ]),
                ),
              ),
            ),
            if (applicationFormLogic.isLoading.value) const AppLoader()
          ],
        );
      }),
    );
  }

  var _dropdownValues = ["Yes", "No"];
}
