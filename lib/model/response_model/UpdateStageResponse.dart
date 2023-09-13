import 'package:jan_suraksha/model/response_main_model/LoginResponseMainModel.dart';
import 'package:jan_suraksha/model/response_main_model/UpdateStageResponseMain.dart';
import 'package:jan_suraksha/services/response/tg_response.dart';

class UpdateStageResponse extends TGResponse {
  UpdateStageResponseMain _updateStageResponseMain = UpdateStageResponseMain();

  UpdateStageResponse();

  UpdateStageResponse.fromJson(dynamic json) {
    fromJson(json);
  }

  @override
  fromJson(json) {
    _updateStageResponseMain = UpdateStageResponseMain.fromJson(json);
  }

  UpdateStageResponseMain updateApplicationStage() {
    return _updateStageResponseMain;
  }
}
