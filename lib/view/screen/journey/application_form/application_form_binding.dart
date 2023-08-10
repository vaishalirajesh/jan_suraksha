import 'package:get/get.dart';

import 'application_form_logic.dart';

class ApplicationFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApplicationFormLogic>(ApplicationFormLogic());
  }
}
