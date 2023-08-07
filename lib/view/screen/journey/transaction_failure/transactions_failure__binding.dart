import 'package:get/get.dart';

import 'transactions_failure__logic.dart';

class Transactions_failure_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Transactions_failure_Logic());
  }
}
