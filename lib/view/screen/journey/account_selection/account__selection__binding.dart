import 'package:get/get.dart';

import 'account__selection__logic.dart';

class AccountSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Account_Selection_Logic());
  }
}
