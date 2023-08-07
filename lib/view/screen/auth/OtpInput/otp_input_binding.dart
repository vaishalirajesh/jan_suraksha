import 'package:get/get.dart';

import 'otp_input_logic.dart';

class OtpInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpInputLogic());
  }
}
