import 'package:get/get.dart';

import 'customer_verification_logic.dart';

class Customer_verificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Customer_verificationLogic());
  }
}
