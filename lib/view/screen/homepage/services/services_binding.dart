import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/homepage/services/services_logic.dart';

class ServicesTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ServicesLogic>(ServicesLogic());
  }
}
