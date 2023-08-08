import 'package:get/get.dart';

import 'customer_verification_logic.dart';

class CustomerVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Customer_verificationLogic());
  }
}
