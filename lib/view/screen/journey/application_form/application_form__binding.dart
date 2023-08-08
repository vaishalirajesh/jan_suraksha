import 'package:get/get.dart';

import 'application_form__logic.dart';

class ApplicationFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Application_form_Logic());
  }
}
