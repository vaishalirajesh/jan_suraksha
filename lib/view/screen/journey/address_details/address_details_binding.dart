import 'package:get/get.dart';

import 'address_details_logic.dart';

class Address_detailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Address_detailsLogic());
  }
}
