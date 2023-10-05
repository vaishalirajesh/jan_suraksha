import 'package:get/get.dart';
import 'package:jan_suraksha/view/screen/journey/cirtificate_insurence/certificate_insurence_binding.dart';
import 'package:jan_suraksha/view/screen/journey/cirtificate_insurence/certificate_insurence_view.dart';

import '../../../../services/singleton/shared_preferences.dart';
import '../../../../utils/constant/argument_constant.dart';
import '../../../../utils/constant/prefrenceconstants.dart';

class ConsentSuccessLogic extends GetxController {
  RxInt schemeId = 0.obs;

  @override
  Future<void> onInit() async {
    schemeId.value = await TGSharedPreferences.getInstance().get(PREF_SCHEME_ID) ?? 0;
    var appId = await TGSharedPreferences.getInstance().get(PREF_APP_ID) ?? 0;
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => CertificateInsurencePage(), binding: CertificateInsurenceBinding(), arguments: {
        AppArguments.schemaId: schemeId.value,
        AppArguments.appId: appId,
      });
    });
    super.onInit();
  }
}
