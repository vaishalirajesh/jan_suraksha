import 'package:get/get.dart';
import 'package:jan_suraksha/services/services.dart';

import '../../../../model/request_model/GetSchemaByUserIdRequest.dart';
import '../../../../model/response_model/GetSchemaByUserIdResponse.dart';

class SelectSchemeLogic extends GetxController {
  var isSchemeSelected = false.obs;
  var isSelected = 0.obs;

  @override
  void onInit() {
    getSchemees();
    super.onInit();
  }

  void getSchemees() {
    ServiceManager.getInstance().getSchemaByUserId(request: GetSchemaByUserIdRequest(), onSuccess: (response) => _onsuccsessresponse(response), onError: (response) => _onErrorResponse(response));
  }

  _onsuccsessresponse(GetSchemaByUserIdResponse response) {
    print(response);
  }

  _onErrorResponse(response) {}
}
