import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/journey/ResponseView/response_view_logic.dart';

class ResponseViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResponseViewLogic());
  }
}
