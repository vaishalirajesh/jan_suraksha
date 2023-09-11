import 'package:get/get.dart';
import 'package:jan_suraksha/utils/constant/argument_constant.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';

class VerifyOtpLogic extends GetxController {
  RxString otp = ''.obs;

  RxString mobile = ''.obs;
  RxBool isValideOTP = true.obs;

  @override
  void onInit() {
    mobile.value = Get.arguments[AppArguments.mobileNumber] ?? '';
    super.onInit();
  }

  void onPressSubmit() {
    if (otp.value.length == 4) {
      Get.offAll(() => DashboardPage(), binding: DashboardBinding());
    } else {
      isValideOTP.value = false;
    }
    // OTPBottomSheet.getBottomSheet(
    //   onChangeOTP: onChangeOTP,
    //   onSubmitOTP: onSubmitOTP,
    //   mobileNumber: mobile.value,
    //   isForBank: true,
    //   isEnable: otp.value.length >= 4 ? true : false,
    //   isLoading: otp.value.length >= 4 ? true : false,
    // );
  }

  void onChangeOTP(String str) {
    isValideOTP.value = true;
    otp.value = str;
  }

  void onSubmitOTP(String str) {
    otp.value = str;
  }
}
