import 'package:jan_suraksha/model/response_main_model/GetOrgMasterListResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class GetOrgMasterListResponse extends TGResponse {
  GetOrgMasterListResponseMain _getOrgMasterListResponseMain = GetOrgMasterListResponseMain();

  GetOrgMasterListResponse();

  GetOrgMasterListResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _getOrgMasterListResponseMain = GetOrgMasterListResponseMain.fromJson(json);
  }

  GetOrgMasterListResponseMain getOrgMasterList() {
    return _getOrgMasterListResponseMain;
  }
}
