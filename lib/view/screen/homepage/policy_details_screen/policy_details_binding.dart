import 'package:get/get.dart';

import 'policy_details_logic.dart';

class Policy_detailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Policy_detailsLogic());
  }
}
