import 'package:get/get.dart';

import 'congratulations_screen_logic.dart';

class Congratulations_screenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Congratulations_screenLogic());
  }
}
