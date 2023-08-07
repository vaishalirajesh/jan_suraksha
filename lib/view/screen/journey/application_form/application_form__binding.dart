import 'package:get/get.dart';

import 'application_form__logic.dart';

class Application_form_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Application_form_Logic());
  }
}
