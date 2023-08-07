import 'package:get/get.dart';

import 'nominee_details__logic.dart';

class Nominee_details_Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Nominee_details_Logic());
  }
}
