import 'package:get/get.dart';

import 'address_details_logic.dart';

class AddressDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Address_detailsLogic());
  }
}
