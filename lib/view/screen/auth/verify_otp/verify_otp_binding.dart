import 'package:get/get.dart';

import 'verify_otp_logic.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyOtpLogic());
  }
}
