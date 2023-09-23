import 'package:get/get.dart';
import 'package:jan_suraksha/services/services.dart';
import 'package:jan_suraksha/services/singleton/shared_preferences.dart';
import 'package:jan_suraksha/utils/constant/prefrenceconstants.dart';

import '../../../../model/request_model/GetSchemaByUserIdRequest.dart';
import '../../../../model/response_model/GetSchemaByUserIdResponse.dart';

class SelectSchemeLogic extends GetxController {
  var isSchemeSelected = false.obs;
  var isSelected = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getSchemees() async {
    ServiceManager.getInstance().getSchemaByUserId(
        request: GetSchemaByUserIdRequest(id: '1'),
        onSuccess: (response) => _onsuccsessresponse(response),
        onError: (response) => _onErrorResponse(response));
  }

  _onsuccsessresponse(GetSchemaByUserIdResponse response) {
    print(response);
  }

  _onErrorResponse(response) {}
}
