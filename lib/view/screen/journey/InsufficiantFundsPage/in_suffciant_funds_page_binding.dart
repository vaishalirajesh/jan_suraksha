import 'package:get/get.dart';

import 'in_suffciant_funds_page_logic.dart';

class InSuffciantFundsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InSuffciantFundsPageLogic());
  }
}
