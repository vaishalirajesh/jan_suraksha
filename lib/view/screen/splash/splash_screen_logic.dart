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
    LoginRequest loginRequest = LoginRequest(
      email: 'paresh.ibo@opl.com',
      password: 'admin@123',
      browserName: 'chorme',
      browserVersion: '123.00',
      device: "smasung",
      deviceOs: 'windows',
      deviceOsVersion: 'windows-10',
      deviceType: 'desktop',
      userAgent:
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36',
      userType: '2',
    );

    // String data = jsonEncode(loginRequest);
    // var encrypt = AesGcmEncryptionUtils.encryptNew(data);
    // TGLog.d("Encrypted test--=-----------${encrypt}");
    TGLog.d(
        "Decrypt test-----------------${AesGcmEncryptionUtils.decryptNew("VnlSdVBBZ0hIK3p2TWtodzZQWUdVc2Vmcmc4eWhlQnhtTGZ5a0dnTzY5RURuMGI4bkdTN0dWZUE1dHdGeVZaOTh6cEJwUFM0a29uTDNzdzZSbHB0UEVBcUN3NHFnQmk2SFlNcU9jVFlwS3BsVlVQMzJIRHRnMzFMdU5xeVNrOWVzSjRhcWFaa2FBNmcxY3VuSkJFZFl6cTFISDBDL0wxV1B6N2ZEbGluVzlIRjBzb2RjeVJmMkZrRDlCRFhibUpzRjl5SXhld2xxVmxHd3V4TVUxTmJXOWNLNEF2ZnhxWUEwY3djT3Fick1LNTBEeUlRaGpoUytQUUNuVGhVWGErMklTb1JPam5KamdsYUhtZFpsOGFOcEhHRCtBR1dDVk44RFlscjhIZmhtMWFjS0dGWXpxMGhoLzJKem14WmhTZGlOajNhUERHOTg0ZFNFSUFJZklXcmdzcjJqNXZCZ05IcXZrNUlTL0VUMmsxZHpidnpFOEs4bkRzbHZ4MXJnb3lFRWRERVlqT0ZneFJJQnNnanE4S3drekhmRkN5Z2dmMXRXeWMzT1YrN0JBaVo2OXdNTWpBWjRpVnBGRjg0TFVWdi9NMXp2K1ZjWUUzT0QzVkIwNmx4UlRzelg5QT06OjEzLTA5LTIwMjMgMDU6MjM=")}");

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const LoginPage(), binding: LoginBinding());
    });
    super.onInit();
  }
}
