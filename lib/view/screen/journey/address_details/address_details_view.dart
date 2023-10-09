import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/utils/utils.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_loader.dart';
import 'package:jan_suraksha/view/widget/disable_test_field.dart';

import 'address_details_logic.dart';

class AddressDetailsPage extends StatelessWidget {
  AddressDetailsPage({Key? key}) : super(key: key);

  final addressDetailsLogic = Get.find<AddressDetailsLogic>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppUtils.onWillPopScope,
      child: Obx(() {
        return Stack(
          children: [
            AddHeaderFooter(
              appbarName: AppString.appBarWithTitleAndProgressBar,
              title: AppString.addressDetails,
              buttonTitle: AppString.continueText,
              onButtonClick: addressDetailsLogic.onPressContinue,
              isDataLoading: false,
              isButtonEnable: true,
              onBackButtonCLick: AppUtils.onBackPress,
              progress: 0.5,
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Obx(
                  () => !addressDetailsLogic.isLoading.value
                      ? const SizedBox.shrink()
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              DisableTextField(
                                isMandatory: true,
                                initialvale: addressDetailsLogic.getAppData.data?.address?.addressLine1 ?? '',
                                title: AppString.addressLine1,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: false,
                                initialvale: addressDetailsLogic.getAppData.data?.address?.addressLine2 ?? '',
                                title: AppString.addressLine2,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: addressDetailsLogic.getAppData.data?.address?.city ?? '',
                                title: AppString.city,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: addressDetailsLogic.getAppData.data?.address?.district ?? '',
                                title: AppString.district,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: addressDetailsLogic.getAppData.data?.address?.state ?? '',
                                title: AppString.state,
                                isReadOnly: true,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              DisableTextField(
                                isMandatory: true,
                                initialvale: addressDetailsLogic.getAppData.data?.address?.pincode != null
                                    ? '${addressDetailsLogic.getAppData.data?.address?.pincode}'
                                    : '',
                                title: AppString.pincode,
                                isReadOnly: true,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            if (!addressDetailsLogic.isLoading.value) AppLoader()
          ],
        );
      }),
    );
  }
}
