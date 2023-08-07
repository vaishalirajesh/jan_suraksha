import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/homepage/services/services_logic.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServicesLogic());
  }
}
