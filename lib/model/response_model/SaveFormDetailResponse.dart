import 'package:jan_suraksha/model/response_main_model/SaveFormDetailResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class SaveFormDetailResponse extends TGResponse {
  SaveFormDetailResponseMain _saveFormDetailResponseMain = SaveFormDetailResponseMain();

  SaveFormDetailResponse();

  SaveFormDetailResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _saveFormDetailResponseMain = SaveFormDetailResponseMain.fromJson(json);
  }

  SaveFormDetailResponseMain saveFormDetail() {
    return _saveFormDetailResponseMain;
  }
}
