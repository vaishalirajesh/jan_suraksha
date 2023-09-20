import 'package:get/get.dart';
import 'package:jan_suraksha/model/response_main_model/GetApplicationFormDetailsResponseMain.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';
import 'package:jan_suraksha/view/screen/journey/nominee_details/nominee_details_binding.dart';
import 'package:jan_suraksha/view/screen/journey/nominee_details/nominee_details_view.dart';

class AddressDetailsLogic extends GetxController {
  RxBool isLoading = false.obs;
  GetApplicationFormDetailsResponseMain getAppData = GetApplicationFormDetailsResponseMain();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    Future.delayed(const Duration(seconds: 1), () async {
      String data = await TGSharedPreferences.getInstance().get(PREF_USER_FORM_DATA);
      getAppData = getApplicationFormDetailsResponseMainFromJson(data);
      isLoading.value = true;
    });
  }

  void onPressContinue() {
    Get.to(() => NomineeDetailsPage(), binding: NomineeDetailsBinding());
  }
}
