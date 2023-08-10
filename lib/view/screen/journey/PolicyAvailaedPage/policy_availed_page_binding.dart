import 'package:get/get.dart';

import 'policy_availed_page_logic.dart';

class PolicyAvailedPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PolicyAvailedPageLogic());
  }
}
