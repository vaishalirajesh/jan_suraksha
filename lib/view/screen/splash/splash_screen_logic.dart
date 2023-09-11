import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_binding.dart';
import 'package:jan_suraksha/view/screen/auth/login/login_view.dart';

class SplashScreenLogic extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const LoginPage(), binding: LoginBinding());
    });
    super.onInit();
  }
}
