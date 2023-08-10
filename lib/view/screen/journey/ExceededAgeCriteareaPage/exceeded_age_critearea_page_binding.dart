import 'package:get/get.dart';

import 'exceeded_age_critearea_page_logic.dart';

class ExceededAgeCriteareaPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExceededAgeCriteareaPageLogic());
  }
}
