import 'package:get/get.dart';

import 'bank_selection_logic.dart';

class BankSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Bank_selectionLogic());
  }
}
