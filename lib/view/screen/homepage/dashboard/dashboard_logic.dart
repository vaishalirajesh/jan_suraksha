import 'package:get/get.dart';

class DashboardLogic extends GetxController {
  var index = 0.obs;

  var isExpandedScheme = true.obs;

  var isExpandedNominee = true.obs;

  setIndex(int value) {
    index.value = value;
  }

  void changeSchemaData() {
    if (isExpandedScheme.value) {
      isExpandedNominee.value = true;
    }
    isExpandedScheme.value = !isExpandedScheme.value;
  }

  void changeNomineeData() {
    if (isExpandedNominee.value) {
      isExpandedScheme.value = true;
    }
    isExpandedNominee.value = !isExpandedNominee.value;
  }
}
