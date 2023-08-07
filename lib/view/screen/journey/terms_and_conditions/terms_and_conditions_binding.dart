import 'package:get/get.dart';

import 'terms_and_conditions_logic.dart';

class Terms_and_conditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Terms_and_conditionsLogic());
  }
}
