import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';

import '../../../config/color_config.dart';
import '../../../config/font_config.dart';
import '../../../config/style_config.dart';
import '../../../utils/constant/string_constant.dart';
import '../../../utils/utils.dart';
import '../../widget/app_textfield.dart';
import 'personal_info_logic.dart';

class PersonalInfoPage extends StatelessWidget {
  PersonalInfoPage({Key? key}) : super(key: key);

  final personallogic = Get.find<PersonalInfoLogic>();

  @override
  Widget build(BuildContext context) {
    return AddHeaderFooter(
      appbarName: AppString.appBarWithTitle,
      title: "Personal Info",
      buttonTitle: "Go Back",
      onButtonClick: () {
        AppUtils.onBackPress();
      },
      onBackButtonCLick: AppUtils.onBackPress,
      isDataLoading: false,
      isButtonEnable: true,
      isShowButton: true,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: StyleConfig.boldText16.copyWith(
                color: ColorConfig.jsBlackColor,
                fontFamily: JSFonts.outfitRegular,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => AppTextField(
                  hintText: "",
                  isReadOnly: true,
                  isMandatory: true,
                  isAutoFocus: true,
                  inputType: TextInputType.emailAddress,
                  maxLength: 30,
                  controller:
                      TextEditingController(text: personallogic.userName.value),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Mobile Number",
              style: StyleConfig.boldText16.copyWith(
                color: ColorConfig.jsBlackColor,
                fontFamily: JSFonts.outfitRegular,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => AppTextField(
                hintText: "",
                isReadOnly: true,
                isMandatory: true,
                isAutoFocus: true,
                inputType: TextInputType.emailAddress,
                maxLength: 30,
                controller: TextEditingController(
                  text: personallogic.mobilenumber.value,
                ))),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Email ID",
              style: StyleConfig.boldText16.copyWith(
                color: ColorConfig.jsBlackColor,
                fontFamily: JSFonts.outfitRegular,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextField(
                hintText: "",
                isReadOnly: false,
                isMandatory: true,
                isAutoFocus: true,
                inputType: TextInputType.emailAddress,
                maxLength: 30,
                controller: TextEditingController()),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: StyleConfig.boldText16.copyWith(
                color: ColorConfig.jsBlackColor,
                fontFamily: JSFonts.outfitRegular,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextField(
                hintText: "",
                isReadOnly: false,
                isMandatory: true,
                isAutoFocus: true,
                inputType: TextInputType.emailAddress,
                maxLength: 30,
                controller: TextEditingController())
          ],
        ),
      ),
    );
  }
}
