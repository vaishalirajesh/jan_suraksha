import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/journey/cirtificate_insurence/certificate_insurence_binding.dart';
import 'package:jan_suraksha/view/screen/journey/cirtificate_insurence/certificate_insurence_view.dart';

class ConsentSuccessLogic extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => CertificateInsurencePage(), binding: CertificateInsurenceBinding());
    });
    super.onInit();
  }
}
