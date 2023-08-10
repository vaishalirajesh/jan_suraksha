import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/journey/nominee_details/nominee_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/nominee_details/nominee_details_view.dart';

class AddressDetailsLogic extends GetxController {
  RxBool isDataLoaded = false.obs;

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) {
      isDataLoaded.value = true;
    });
    super.onInit();
  }

  void onPressContinue() {
    Get.to(() => NomineeDetailsPage(), binding: NomineeDetailsBinding());
  }
}
