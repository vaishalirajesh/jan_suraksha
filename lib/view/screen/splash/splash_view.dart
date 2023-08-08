import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jan_suraksha/utils/constant/string_constant.dart';
import 'package:jan_suraksha/view/widget/app_common_screen.dart';
import 'package:jan_suraksha/view/widget/app_textfield.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController(text: '667676767');

  @override
  Widget build(BuildContext context) {
    return AddHeaderFooter(
      title: "Testing header",
      appbarName: AppString.appBarWithTitle,
      buttonTitle: "Test Button",
      onButtonClick: () {},
      isDataLoading: false,
      isButtonEnable: true,
      subTitle: "Happy to have you onboard! Let's start by finding out which insurance you need.",
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: AppTextField(
            hintText: "Hello",
            controller: controller,
            isReadOnly: false,
            title: "First Name",
            isMandatory: true,
          ),
        ),
      ),
    );
  }
}
