import 'package:get/get.dart';

import 'policy_details_logic.dart';

class PolicyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Policy_detailsLogic());
  }
}
