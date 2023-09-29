import 'package:get/get.dart';

import '../../../services/singleton/shared_preferences.dart';
import '../../../utils/constant/prefrenceconstants.dart';

class PersonalInfoLogic extends GetxController {
  RxString userName = ''.obs;
  RxString mobilenumber = ''.obs;



  @override
  Future<void> onInit() async {
    userName.value = await TGSharedPreferences.getInstance().get(PREF_USER_NAME) ?? '';
    mobilenumber.value = await TGSharedPreferences.getInstance().get(PREF_MOBILE) ?? '';
    super.onInit();
  }

}
