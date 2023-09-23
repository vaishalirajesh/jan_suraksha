import 'package:jan_suraksha/model/response_main_model/GetMasterListResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class GetMasterListResponse extends TGResponse {
  GetMasterListResponseMain _getMasterListResponseMain = GetMasterListResponseMain();

  GetMasterListResponse();

  GetMasterListResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _getMasterListResponseMain = GetMasterListResponseMain.fromJson(json);
  }

  GetMasterListResponseMain getMasterList() {
    return _getMasterListResponseMain;
  }
}
