import 'package:get/get.dart';

import 'nominee_details__logic.dart';

class NomineeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Nominee_details_Logic());
  }
}
