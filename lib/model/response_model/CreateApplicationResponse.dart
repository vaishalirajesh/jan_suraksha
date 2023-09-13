import 'package:jan_suraksha/model/response_main_model/CreateApplicationResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class CreateApplicationResponse extends TGResponse {
  CreateApplicationResponseMain _createApplicationResponseMain = CreateApplicationResponseMain();

  CreateApplicationResponse();

  CreateApplicationResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _createApplicationResponseMain = CreateApplicationResponseMain.fromJson(json);
  }

  CreateApplicationResponseMain createApplicationResponse() {
    return _createApplicationResponseMain;
  }
}
