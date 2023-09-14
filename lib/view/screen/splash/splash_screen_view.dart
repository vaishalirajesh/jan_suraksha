import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/image_constant.dart';

import 'splash_screen_logic.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({Key? key}) : super(key: key);

  final logic = Get.find<SplashScreenLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashBg),
            fit: BoxFit.fill,
          ),
          // color: Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 60.h),
                SvgPicture.asset(AppImages.splashLogo),
                SizedBox(height: 40.h),
                SvgPicture.asset(AppImages.splash_text),
              ],
            ),
            Image.asset(
              AppImages.modiji,
              height: 0.44.sh,
            ),
          ],
        ),
      ),
    );
  }
}
