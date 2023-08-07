import 'package:get/get.dart';

import 'preview_application_form_logic.dart';

class Preview_application_formBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Preview_application_formLogic());
  }
}
