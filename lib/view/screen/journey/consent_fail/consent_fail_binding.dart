import 'package:get/get.dart';

import 'consent_fail_logic.dart';

class ConsentFailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConsentFailLogic>(ConsentFailLogic());
  }
}
