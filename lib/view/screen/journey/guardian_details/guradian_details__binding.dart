import 'package:get/get.dart';

import 'guradian_details__logic.dart';

class Guradian_details_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Guradian_details_Logic());
  }
}
