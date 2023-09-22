import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/auth/Registration/registration_logic.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationLogic());
  }
}
