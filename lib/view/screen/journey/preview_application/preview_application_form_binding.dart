import 'package:get/get.dart';

import 'preview_application_form_logic.dart';

class PreviewApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Preview_application_formLogic());
  }
}
