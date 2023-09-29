import 'package:get/get.dart';

import 'genral_faq_logic.dart';

class GenralFaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GenralFaqLogic());
  }
}
