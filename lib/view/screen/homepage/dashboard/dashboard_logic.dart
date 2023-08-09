import 'package:get/get.dart';

class DashboardLogic extends GetxController {
  var index = 0.obs;
  setIndex(value) {
    index.value = value;
  }
}
