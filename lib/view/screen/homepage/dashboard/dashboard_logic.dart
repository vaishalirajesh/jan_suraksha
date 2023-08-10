import 'package:get/get.dart';
import 'package:gstmobieservice_marketplace/common/tg_log.dart';

class DashboardLogic extends GetxController {
  var index = 0.obs;

  var isExpandedScheme = false.obs;

  var isExpandedNominee = false.obs;
  setIndex(int value) {
    TGLog.d("value $value");
    index.value = value;
  }
}
