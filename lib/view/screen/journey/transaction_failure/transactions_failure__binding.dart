import 'package:get/get.dart';

import 'transactions_failure__logic.dart';

class TransactionsFailureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Transactions_failure_Logic());
  }
}
