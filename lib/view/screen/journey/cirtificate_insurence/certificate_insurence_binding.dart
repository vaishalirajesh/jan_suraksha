import 'package:get/get.dart';

import 'certificate_insurence_logic.dart';

class Certificate_insurenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Certificate_insurenceLogic());
  }
}
