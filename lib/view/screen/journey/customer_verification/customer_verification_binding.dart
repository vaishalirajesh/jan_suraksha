import 'package:get/get.dart';

import 'customer_verification_logic.dart';

class CustomerVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CustomerVerificationLogic>(CustomerVerificationLogic());
  }
}
