import 'package:get/get.dart';

import 'guradian_details_logic.dart';

class GuradianDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GuradianDetailsLogic>(GuradianDetailsLogic());
  }
}
