import 'package:jan_suraksha/model/response_main_model/GetStageDetailResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class GetStageDetailResponse extends TGResponse {
  GetStageDetailResponseMain _getStageDetailResponseMain = GetStageDetailResponseMain();

  GetStageDetailResponse();

  GetStageDetailResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _getStageDetailResponseMain = GetStageDetailResponseMain.fromJson(json);
  }

  GetStageDetailResponseMain getStageDetail() {
    return _getStageDetailResponseMain;
  }
}
