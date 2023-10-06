import 'package:get/get.dart';
import 'package:jan_suraksha/config/Navigation_config.dart';
import 'package:jan_suraksha/services/common/keys.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/startup.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_binding.dart';
import 'package:jan_suraksha/view/screen/homepage/dashboard/dashboard_view.dart';

import '../auth/login/login_binding.dart';
import '../auth/login/login_view.dart';

class SplashScreenLogic extends GetxController {
  RxBool isloading = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void checkStatus() {
    if (!Startup.initialized) {
      Startup.init();
    }
    Future.delayed(const Duration(seconds: 8), () async {
      if (!(Get.currentRoute == DashboardPageRoute || Get.currentRoute == LoginPageRoute)) {
        if ((await TGSharedPreferences.getInstance().get(PREF_ACCESS_TOKEN)) != null) {
          Get.offAll(() => DashboardPage(), binding: DashboardBinding());
          isloading.value = false;
        } else {
          Get.offAll(() => LoginPage(), binding: LoginBinding());
          isloading.value = false;
        }
      }
    });
  }
}
