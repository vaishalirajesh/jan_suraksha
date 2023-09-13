import 'package:get/get.dart';

class DashboardLogic extends GetxController {
  var index = 0.obs;

  var isExpandedScheme = false.obs;

  var isExpandedNominee = false.obs;

  setIndex(int value) {
    index.value = value;
  }
}
