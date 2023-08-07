import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/homepage/support/support_logic.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupportLogic());
  }
}
