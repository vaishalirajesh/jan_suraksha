import 'package:jan_suraksha/model/response_main_model/GetSchemaByUserIdResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class GetSchemaByUserIdResponse extends TGResponse {
  GetSchemaBYUserIdResponseMain _getSchemaBYUserIdResponseMain = GetSchemaBYUserIdResponseMain();

  GetSchemaByUserIdResponse();

  GetSchemaByUserIdResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _getSchemaBYUserIdResponseMain = GetSchemaBYUserIdResponseMain.fromJson(json);
  }

  GetSchemaBYUserIdResponseMain getSchemaByUserId() {
    return _getSchemaBYUserIdResponseMain;
  }
}
