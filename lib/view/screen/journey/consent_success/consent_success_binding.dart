import 'package:get/get.dart';

import 'consent_success_logic.dart';

class ConsentSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConsentSuccessLogic>(ConsentSuccessLogic());
  }
}
