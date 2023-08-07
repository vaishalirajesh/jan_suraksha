import 'package:get/get.dart';

import 'bank_selection_logic.dart';

class Bank_selectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Bank_selectionLogic());
  }
}
