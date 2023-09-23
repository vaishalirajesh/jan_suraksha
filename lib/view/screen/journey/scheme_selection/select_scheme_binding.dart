import 'package:get/get.dart';

import 'select_scheme_logic.dart';

class SelectSchemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SelectSchemeLogic>(SelectSchemeLogic());
  }
}
