import 'package:get/get.dart';

import 'nominee_details_logic.dart';

class NomineeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NomineeDetailsLogic>(NomineeDetailsLogic());
  }
}
