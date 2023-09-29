import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/color_config.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/screen/journey/nominee_details/nominee_details_logic.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';
import 'package:jan_suraksha/view/widget/app_textfield.dart';

import '../../../../config/style_config.dart';
import 'guradian_details_logic.dart';

class GuradianDetailsPage extends StatelessWidget {
  GuradianDetailsPage({Key? key}) : super(key: key);

  final guradianDetailsLogic = Get.find<GuradianDetailsLogic>();
  final nomineeDetailsLogic = Get.find<NomineeDetailsLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: Obx(() {
        return Stack(
          children: [
            AddHeaderFooter(
              appbarName: AppString.appBarWithTitleAndProgressBar,
              title: AppString.gaurdianDetails,
              buttonTitle: AppString.continueText,
              onButtonClick: guradianDetailsLogic.onPressContinue,
              isDataLoading: false,
              onBackButtonCLick: AppUtils.onBackPress,
              isButtonEnable: true,
              progress: 0.7,
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
                                  errorText: guradianDetailsLogic.fNameErrorMsg.value,
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
                                  errorText: guradianDetailsLogic.addressErrorMsg.value,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Relationship with the Nominee",
                                            style: StyleConfig.mediumText16,
                                          ),
                                          TextSpan(
                                            text: "*",
                                            style: StyleConfig.mediumText16.copyWith(color: ColorConfig.jsPrimaryColor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                nomineeDetailsLogic.items.value.isEmpty
                                    ? AppTextField(
                                        isMandatory: true,
                                        title: AppString.relation,
                                        controller: nomineeDetailsLogic.relationWithApplicantController,
                                        hintText: AppString.selectRelation,
                                        inputType: TextInputType.text,
                                        // suffix: DropdownButtonFormField(
                                        //   padding: EdgeInsets.zero,
                                        //   dropdownColor: ColorConfig.jsPrimaryColor,
                                        //   value: nomineeDetailsLogic.selectedValue.value,
                                        //   decoration: InputDecoration(
                                        //     contentPadding: EdgeInsets.zero,
                                        //     isDense: true,
                                        //     border: null,
                                        //   ),
                                        //   onChanged: (newValue) {
                                        //     nomineeDetailsLogic.selectedValue.value = newValue ?? '';
                                        //   },
                                        //   items: nomineeDetailsLogic.items.map<DropdownMenuItem<String>>((String value) {
                                        //     return DropdownMenuItem<String>(
                                        //       value: value,
                                        //       child: Text(
                                        //         value,
                                        //         overflow: TextOverflow.ellipsis,
                                        //       ),
                                        //     );
                                        //   }).toList(),
                                        // ),
                                      )
                                    : Container(
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
                                              items: nomineeDetailsLogic.items.values
                                                  .map((value) => DropdownMenuItem(
                                                        child: Container(
                                                            width: 0.75.sw,
                                                            child: Text(
                                                              value,
                                                              style: StyleConfig.mediumText16,
                                                            )),
                                                        value: value,
                                                      ))
                                                  .toList(),
                                              onChanged: (i) {
                                                nomineeDetailsLogic.items.value.forEach((key, value) {
                                                  if (i.toString() == value) {
                                                    nomineeDetailsLogic.guardianid.value = int.parse(key);
                                                  }
                                                });
                                                nomineeDetailsLogic.relationWithApplicantController.text = i!;
                                                nomineeDetailsLogic.guardianShipValue.value = i.toString();
                                                guradianDetailsLogic.relationWithApplicantController.text = i;
                                                print(i!);
                                              },
                                              isExpanded: false,
                                              value: nomineeDetailsLogic.guardianShipValue.value,
                                              hint: Text(nomineeDetailsLogic.items.value.values.first, style: StyleConfig.mediumText16),
                                            ),
                                          ),
                                        ),
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
