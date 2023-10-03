import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/config/style_config.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';

import '../../../../config/color_config.dart';
import 'consent_success_binding.dart';
import 'consent_success_logic.dart';

class ConsentSuccessPage extends StatelessWidget {
  const ConsentSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final consentSuccessLogic = Get.find<ConsentSuccessLogic>();
    return WillPopScope(
      onWillPop: () async {
        Get.to(() => const ConsentSuccessPage(), binding: ConsentSuccessBinding());
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorConfig.jsCreamColor,
        body: SizedBox(
          height: 1.sh,
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                SvgPicture.asset(AppImages.success),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Congratulation!",
                  style: StyleConfig.boldLargeText.copyWith(color: ColorConfig.jsPrimaryColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(() {
                  return Text(
                    "Your application for availing the policy under ${consentSuccessLogic.schemeId.value.toString() == "2" ? "PMJJBY" : "PMSBY"} has been successful and the premium has been debited. You will be notified via SMS for the same.",
                    style: StyleConfig.smallTextLight.copyWith(color: ColorConfig.jsTextGreyColor),
                    textAlign: TextAlign.center,
                    maxLines: 4,
                  );
                }),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Thank you",
                  style: StyleConfig.boldMediumText.copyWith(color: ColorConfig.jsTextGreyColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
