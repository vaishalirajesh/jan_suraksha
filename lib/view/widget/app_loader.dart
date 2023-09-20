import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jan_suraksha/config/color_config.dart';

import 'jumpingdot_util.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      color: ColorConfig.jsBlackColor.withOpacity(0.5),
      child: Center(
        child: JumpingDots(
          color: ColorConfig.jsPrimaryColor,
          radius: 9,
        ),
      ),
    );
  }
}
