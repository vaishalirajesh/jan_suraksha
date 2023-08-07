import 'package:get/get.dart';

import 'MobileNumberInputLogic.dart';

class MobileNumberInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MobileNumberInputLogic());
  }
}
