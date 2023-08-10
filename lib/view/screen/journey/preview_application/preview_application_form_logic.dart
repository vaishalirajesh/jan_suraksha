import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/journey/terms_and_conditions/terms_and_conditions_binding.dart';
import 'package:jan_suraksha/view/screen/journey/terms_and_conditions/terms_and_conditions_view.dart';

class PreviewApplicationFormLogic extends GetxController {
  RxBool isDataLoaded = true.obs;

  void onPressContinue() {
    Get.to(() => TermsAndConditionsPage(), binding: TermsAndConditionsBinding());
  }
}
