import 'package:get/get.dart';
import 'package:gstmobieservice_marketplace/common/tg_log.dart';
import 'package:jan_suraksha/view/screen/journey/address_details/address_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/address_details/address_details_view.dart';

class ApplicationFormLogic extends GetxController {
  RxBool isDataLoaded = false.obs;
  String firstName = 'KEXXX';

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 2),
    ).then((value) {
      isDataLoaded.value = true;
      TGLog.d("On chnage load value----------${isDataLoaded.value}");
    });
    super.onInit();
  }

  void onPressContinue() {
    Get.to(() => AddressDetailsPage(), binding: AddressDetailsBinding());
  }
}
