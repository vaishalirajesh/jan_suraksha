import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/disable_test_field.dart';

import 'address_details_logic.dart';

class AddressDetailsPage extends StatelessWidget {
  AddressDetailsPage({Key? key}) : super(key: key);

  final addressDetailsLogic = Get.find<AddressDetailsLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return WillPopScope(
        onWillPop: AppUtils.onWillPopScope,
        child: AddHeaderFooter(
          appbarName: AppString.appBarWithTitle,
          title: AppString.addressDetails,
          buttonTitle: AppString.continueText,
          onButtonClick: addressDetailsLogic.onPressContinue,
          isDataLoading: false,
          isButtonEnable: addressDetailsLogic.isDataLoaded.value,
          onBackButtonCLick: AppUtils.onBackPress,
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: Obx(
              () => !addressDetailsLogic.isDataLoaded.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          DisableTextField(
                            isMandatory: true,
                            initialvale: 'Shanti XXXXXX',
                            title: AppString.addressLine1,
                            isReadOnly: true,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const DisableTextField(
                            isMandatory: false,
                            initialvale: 'Indira Gandhi Rd, Opp. XXXX XXXXX XX sfsf sbfdhs hsgdfgsf kfs',
                            title: AppString.addressLine2,
                            isReadOnly: true,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const DisableTextField(
                            isMandatory: true,
                            initialvale: 'Kalol',
                            title: AppString.city,
                            isReadOnly: true,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const DisableTextField(
                            isMandatory: true,
                            initialvale: 'Ahmedabad',
                            title: AppString.district,
                            isReadOnly: true,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const DisableTextField(
                            isMandatory: true,
                            initialvale: 'Gujarat',
                            title: AppString.state,
                            isReadOnly: true,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const DisableTextField(
                            isMandatory: false,
                            initialvale: '123456',
                            title: AppString.pincode,
                            isReadOnly: true,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      );
    });
  }
}
