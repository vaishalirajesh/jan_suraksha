import 'package:get/get.dart';

import 'guradian_details__logic.dart';

class GuradianDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Guradian_details_Logic());
  }
}
