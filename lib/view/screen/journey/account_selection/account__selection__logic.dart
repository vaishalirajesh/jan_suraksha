import 'package:get/get.dart';

class Account_Selection_Logic extends GetxController {
  RxBool selectedWidget = false.obs;

  void onChangeSelection() {
    selectedWidget.value = !selectedWidget.value;
  }
}
