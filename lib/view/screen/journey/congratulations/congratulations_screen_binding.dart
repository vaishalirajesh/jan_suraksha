import 'package:get/get.dart';

import 'congratulations_screen_logic.dart';

class CongratulationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Congratulations_screenLogic());
  }
}
