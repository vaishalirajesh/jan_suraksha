import 'dart:convert';

import 'package:get/get.dart';
import 'package:jan_suraksha/startup.dart';

import '../../../model/request_model/LoginRequest.dart';
import '../../../services/common/tg_log.dart';
import '../../../services/encryption/encdec/aesGcmEncryption.dart';
import '../auth/login/login_binding.dart';
import '../auth/login/login_view.dart';

class SplashScreenLogic extends GetxController {
  @override
  void onInit() {
    Startup.init();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const LoginPage(), binding: LoginBinding());
    });
    super.onInit();
  }
}
